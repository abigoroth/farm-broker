class WelcomeMailer < ApplicationMailer

  def welcome_send(bidder)
    @bidder = bidder
    Rails.logger.debug "Welcome ::::::       #{@bidder.inspect}"
    Rails.logger.debug "Welcome ::::::       #{@bidder.user.inspect}"
    mail to: @bidder.user.email, subject: 'Welcome to Localhost Farm Auction Website'
  end
end
