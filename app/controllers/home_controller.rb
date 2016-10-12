class HomeController < ApplicationController
  def index
  end

  def about
  end

  def news
    @bids = Bid.where(:bid_status => "On").order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
  end

  def contact
  end

end
