class ProducesController < ApplicationController
  before_action :check_meta , if: "user_signed_in?"
  before_action :set_produce, only: [:show, :edit, :update, :destroy]

  # GET /produces
  # GET /produces.json
  def index
    @produces = params[:farmsite_id].present? ? Produce.where(farmsite_id:params[:farmsite_id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
 : Produce.all.order(producename: :asc).paginate(:page => params[:page], :per_page => 10)

    @produces = @produces
    .search("#{params[:search]}")
    .search_state("#{params[:state]}")
    .search_city("#{params[:city]}")

    @farmsite = Farmsite.find(params[:farmsite_id]) if params[:farmsite_id].present?


        # @hash = Gmaps4rails.build_markers(@produces) do |produce, marker|
        #   marker.lat produce.farmsite.latitude
        #   marker.lng produce.farmsite.longitude
        #   marker.infowindow produce.farmsite.farmsitename + "<br> <br> Produces : " + produce.farmsite.produces.map{|x| x.producename }.join(", ")
        # end

  end

  # GET /produces/1
  # GET /produces/1.json
  def show
  end

  # GET /produces/new
  def new
    @produce = Produce.new(farmsite_id: params[:farmsite_id])
  end

  # GET /produces/1/edit
  def edit
  end

  # POST /produces
  # POST /produces.json
  def create
    @produce = current_user.meta.produces.new(produce_params) if(current_user.meta_type == "Farmer")
    logger.debug"before#{@produce.inspect}"
    @produce.save
    logger.debug"after#{@produce.inspect}"
    respond_with(@produce) do |format|
      format.js {render :save,locals:{ object:@produce } }
    end
    # respond_to do |format|
    #   #produce_path(farmsite_id: @produce.farmsite.id
    #   if @produce.save
    #     format.html { redirect_to @produce, notice: 'Produce was successfully created.' }
    #     format.json { render :show, status: :created, location: @produce }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @produce.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /produces/1
  # PATCH/PUT /produces/1.json
  def update
    respond_to do |format|
      if @produce.update(produce_params)
        format.html { redirect_to :back, notice: 'Produce was successfully updated.' }
        format.json { render :show, status: :ok, location: @produce }
      else
        format.js {render :save}
        format.html { render :edit }
        format.json { render json: @produce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produces/1
  # DELETE /produces/1.json
  def destroy
    @produce.destroy
    respond_to do |format|
      format.html { redirect_to farmsite_path(params[:farmsite_id]), notice: 'Produce was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produce
      @produce = Produce.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produce_params
      params.require(:produce).permit(:producename, :producetype, :producedate, :produceharvest, :producequantity, :producedescription, :produceimage, :farmsite_id, :avatar, :broker_id, :farmsitename)
    end
end
