class WelcomeMailer < ApplicationMailer

  def welcome_send(bidder)
    @bidder = bidder
    mail to: @bidder.email, subject: 'Welcome to Localhost Farm Auction Website'
  end
end
