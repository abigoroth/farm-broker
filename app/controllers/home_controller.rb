class HomeController < ApplicationController
  before_action :check_meta , if: "user_signed_in?"
  def index
    @produces = Produce.all
    @farmsites = Farmsite.all
  end

  def about
  end

  def news
    @time = Time.now
    @bid_status = 'On'
    @bids = Bid.where('bid_status = ? AND (? BETWEEN start_time AND end_time)',@bid_status,@time).order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
  end

  def contact
  end

end
