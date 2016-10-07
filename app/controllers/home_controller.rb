class HomeController < ApplicationController
  def index
  end

  def about
  end

  def news
    @bids = Bid.all
  end

  def contact
  end

end
