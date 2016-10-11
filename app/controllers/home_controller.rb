class HomeController < ApplicationController
  def index
  end

  def about
  end

  def news
    @today = Time.now
    @bids = Bid.where('? BETWEEN start_time AND end_time', @today).order('created_at DESC')
    .paginate(:page => params[:page], :per_page => 3)
  end

  def contact
  end

end
