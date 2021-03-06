class FarmersController < ApplicationController
  before_action :set_farmer, only: [:show, :edit, :update, :destroy]

  # GET /farmers
  # GET /farmers.json
  def index
    @farmers = Farmer.all
    @farmers = @farmers.search("#{params[:search]}")
    .search("#{params[:search]}")
    .search_state("#{params[:state]}")
    .search_city("#{params[:city]}")
  end

  # GET /farmers/1
  # GET /farmers/1.json
  def show
  end

  # GET /farmers/new
  def new
    @farmer = Farmer.new
  end

  # GET /farmers/1/edit
  def edit
  end

  # POST /farmers
  # POST /farmers.json
  def create
    @farmer = Farmer.new(farmer_params)
    respond_to do |format|
      if @farmer.save
        current_user.update(meta_id: @farmer.id,meta_type: "Farmer")
        format.html { redirect_to user_views_profile_path(id: current_user.id), notice: 'Your information was successfully saved.' }
        format.json { render :show, status: :created, location: @farmer }
      else
        format.html { render :new }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farmers/1
  # PATCH/PUT /farmers/1.json
  def update
    respond_to do |format|
      if @farmer.update(farmer_params)
        format.html { redirect_to @farmer, notice: 'Farmer was successfully updated.' }
        format.json { render :show, status: :ok, location: @farmer }
      else
        format.html { render :edit }
        format.json { render json: @farmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farmers/1
  # DELETE /farmers/1.json
  def destroy
    @farmer.destroy
    respond_to do |format|
      format.html { redirect_to farmers_url, notice: 'Farmer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farmer
      @farmer = Farmer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farmer_params
      params.require(:farmer).permit(:name, :dob, :address, :phone, :account_no, :company_name, :company_phone, :bank_company)
    end
  end
