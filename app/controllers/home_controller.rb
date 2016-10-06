class HomeController < ApplicationController
  def index
  end

  def about
  end

  def news
  end

  def contact
  end

  def district_page
    @districts = District.all
  end
end
