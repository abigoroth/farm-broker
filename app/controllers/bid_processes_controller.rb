class BidProcessesController < ApplicationController
  before_action :set_bid_process, only: [:show, :edit, :update, :destroy]

  # GET /bid_processes
  # GET /bid_processes.json
  def index
    @bid_processes = BidProcess.all
  end

  # GET /bid_processes/1
  # GET /bid_processes/1.json
  def show
  end

  # GET /bid_processes/new
  def new
    @bid_process = BidProcess.new
  end

  # GET /bid_processes/1/edit
  def edit
  end

  # POST /bid_processes
  # POST /bid_processes.json
  def create
    @bid_process = current_bidder.bid_processes.new(bid_process_params)

    respond_to do |format|
      if @bid_process.save
        format.html { redirect_to @bid_process, notice: 'Bid process was successfully created.' }
        format.json { render :show, status: :created, location: @bid_process }
      else
        format.html { render :new }
        format.json { render json: @bid_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bid_processes/1
  # PATCH/PUT /bid_processes/1.json
  def update
    respond_to do |format|
      if @bid_process.update(bid_process_params)
        format.html { redirect_to @bid_process, notice: 'Bid process was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid_process }
      else
        format.html { render :edit }
        format.json { render json: @bid_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bid_processes/1
  # DELETE /bid_processes/1.json
  def destroy
    @bid_process.destroy
    respond_to do |format|
      format.html { redirect_to bid_processes_url, notice: 'Bid process was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid_process
      @bid_process = BidProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_process_params
      params.require(:bid_process).permit(:bid_id, :price)
    end
end
