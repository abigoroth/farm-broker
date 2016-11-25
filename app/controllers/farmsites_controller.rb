class FarmsitesController < ApplicationController
  before_action :check_meta , if: "user_signed_in?"
  before_action :set_farmsite, only: [:show, :edit, :update, :destroy]

  # GET /farmsites
  # GET /farmsites.json
  def index

   @farmsites = Farmsite.search("#{params[:search]}").search_state("#{params[:state]}").search_city("#{params[:city]}").order(farmsitename: :asc).paginate(:page => params[:page], :per_page => 10)
    #@user = User.find(params[:id])
    @review = Review.new
    

    # sign in
   #if user_signed_in?
         #farmer
      #  if current_user.meta_type == "Farmer"
       #   @farmsites = Farmsite.where(farmer_id: params[:farmer_id] ).order(created_at: :desc)
        #  @hash = Gmaps4rails.build_markers(@farmsites) do |farmsite, marker|
         #    marker.lat farmsite.latitude
          #   marker.lng farmsite.longitude
           #  marker.infowindow farmsite.farmsitename
          #end
          #not farmer
        #else
         # @farmsites = Farmsite.all.order(created_at: :desc)
          #@hash = Gmaps4rails.build_markers(@farmsites) do |farmsite, marker|
           #  marker.lat farmsite.latitude
            # marker.lng farmsite.longitude
            # marker.infowindow farmsite.farmsitename
          #end
        #end

        #tak sign in/public
   #else
        @farmsites = @farmsites.all.order(farmsitename: :asc).paginate(:page => params[:page], :per_page => 10)
        @hash = Gmaps4rails.build_markers(@farmsites) do |farmsite, marker|
          marker.lat farmsite.latitude
          marker.lng farmsite.longitude
          marker.infowindow farmsite.farmsitename + "<br> <br> Produces : " + farmsite.produces.map{|x| x.producename }.join(", ")
        end
   #end
  end

  # GET /farmsites/1
  # GET /farmsites/1.json
  def show
    @produces = Produce.where(farmsite_id: params[:farmsite_id] ).order(created_at: :desc)
     @hash1 = Gmaps4rails.build_markers(@farmsites) do |farmsite, marker|
      marker.lat farmsite.latitude
      marker.lng farmsite.longitudee
      marker.infowindow farmsite.farmsitename
  end
end

  # GET /farmsites/new
  def new
    @farmsite = Farmsite.new
  end

  # GET /farmsites/1/edit
  def edit
  end

  # POST /farmsites
  # POST /farmsites.json
  def create


    @farmsite =current_user.meta.build_farmsite(farmsite_params) if(current_user.meta_type == "Farmer")


    respond_to do |format|
      if @farmsite.save
        format.html { redirect_to farmsites_path(farmer_id:current_user.meta_id), notice: 'Farmsite was successfully created.' }
        format.json { render :show, status: :created, location: @farmsite }
      else
        format.html { render :new }
        format.json { render json: @farmsite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farmsites/1
  # PATCH/PUT /farmsites/1.json
  def update
    respond_to do |format|
      if @farmsite.update(farmsite_params)
        format.html { redirect_to farmsites_path(farmer_id:current_user.meta_id), notice: 'Farmsite was successfully updated.' }
        format.json { render :show, status: :ok, location: @farmsite }
      else
        format.html { render :edit }
        format.json { render json: @farmsite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farmsites/1
  # DELETE /farmsites/1.json
  def destroy
    @farmsite.destroy
    respond_to do |format|
      format.html { redirect_to farmsites_path(farmer_id:current_user.meta_id), notice: 'Farmsite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farmsite
      @farmsite = Farmsite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farmsite_params
      params.require(:farmsite).permit(:farmsitename, :farmsitesize, :farmsiteaddress, :farmsiteownername, :farmsiteownerphoneno, :broker_id, :latitude, :longitude, :avatar, :farmsitedescription, :farmsitecity, :farmsitestate)
    end
end

