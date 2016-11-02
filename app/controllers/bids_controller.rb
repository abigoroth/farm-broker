class BidsController < ApplicationController
  before_action :check_meta , if: "user_signed_in?"
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  # GET /bids
  # GET /bids.json
  def index
    update_bid_status
    @bids = params[:farmer_id].present? ? Bid.all.where( farmer_id: params[:farmer_id] ).order(bid_status: :desc) : Bid.all.where.not(farmer_id: current_user.meta.try(:id)).order(bid_status: :desc)
    @bid = Bid.new
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    @bid = current_user.bids.build
  end

  # GET /bids/1/edit
  def edit
  end

  # POST /bids
  # POST /bids.json
  def create

    @bid = current_user.bids.build(bid_params)
    logger.debug @bid.inspect
    respond_to do |format|
      if @bid.save
        format.html { redirect_to @bid, notice: 'Bid was successfully created.' }
        format.json { render :show, status: :created, location: @bid }
      else
       logger.debug @bid.errors.inspect
       format.html { render :new }
       format.json { render json: @bid.errors, status: :unprocessable_entity }
     end
   end
 end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid }
      else
        format.html { render :edit }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to bids_url, notice: 'Bid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def purchase
    bid = Bid.find(params[:bid_id])
    BidProcess.create(bid_id: bid.id, price: bid.max_price, bidder_id: current_user.id)
    redirect_to bids_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:bid_status, :produce_id, :start_time, :end_time, :start_price, :max_price, :highest_price, :bidder_id)
    end

    def update_bid_status
      Bid.all.each do |bid|

        if Time.now >= bid.end_time or bid.bid_processes.maximum(:price) == bid.max_price
          bid.update(bid_status: "Off" )
        else
          bid.update(bid_status: "On" )
        end
      end
    end



  end
