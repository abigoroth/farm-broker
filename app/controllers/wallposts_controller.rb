class WallpostsController < ApplicationController
  before_action :check_meta , if: "user_signed_in?"
  before_action :set_wallpost, only: [:show, :edit, :update, :destroy]

  # GET /wallposts
  # GET /wallposts.json
  def index
    @wallposts = Wallpost.all.order('created_at DESC')
    @comment = Comment.new
  end

  # GET /wallposts/1
  # GET /wallposts/1.json
  def show
  end

  # GET /wallposts/new
  def new
    @wallpost = current_user.wallposts.build
  end

  # GET /wallposts/1/edit
  def edit
  end

  # POST /wallposts
  # POST /wallposts.json
  def create

    @wallpost = current_user.wallposts.build(wallpost_params)
    if @wallpost.save
    flash[:notice] = 'Post created'
    redirect_to wallposts_path
    else
      format.html { render :new }
      format.json { render json: @wallpost.errors, status: :unprocessable_entity }
    end

  end

  # PATCH/PUT /wallposts/1
  # PATCH/PUT /wallposts/1.json
  def update
    respond_to do |format|
      if @wallpost.update(wallpost_params)
        format.html { redirect_to :back, notice: 'Wallpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @wallpost }
      else
        format.html { render :edit }
        format.json { render json: @wallpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallposts/1
  # DELETE /wallposts/1.json
  def destroy
    @wallpost.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Wallpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallpost
      @wallpost = Wallpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wallpost_params
      params.require(:wallpost).permit(:wall_status, :wall_date, :bootsy_image_gallery_id)
    end
end
