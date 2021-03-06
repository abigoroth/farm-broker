class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  around_filter :user_time_zone, if: :current_user
  respond_to :html,:js, :json
    def cities
      render json: CS.cities(params[:state], :MY).to_json
    end

    def user_time_zone(&block)
      Time.use_zone(current_user.timezone, &block)
    end

    def check_meta
      unless current_user.meta.present?
    	redirect_to "/user_views/meta" 
      end
    end   
end
