class FarmsitesController < ApplicationController
  before_action :set_farmsite, only: [:show, :edit, :update, :destroy]

  # GET /farmsites
  # GET /farmsites.json
  def index
    @farmsites = Farmsite.all
  end

  # GET /farmsites/1
  # GET /farmsites/1.json
  def show
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

    @farmsite =current_broker.farmsites.new(farmsite_params)

    respond_to do |format|
      if @farmsite.save
        format.html { redirect_to @farmsite, notice: 'Farmsite was successfully created.' }
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
        format.html { redirect_to @farmsite, notice: 'Farmsite was successfully updated.' }
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
      format.html { redirect_to farmsites_url, notice: 'Farmsite was successfully destroyed.' }
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
      params.require(:farmsite).permit(:farmsitename, :farmsitesize, :farmsiteaddress, :farmsiteownername, :farmsiteownerphoneno, :broker_id)
    end
end
