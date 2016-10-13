class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

def cities
  render json: CS.cities(params[:state], :MY).to_json
end
end
