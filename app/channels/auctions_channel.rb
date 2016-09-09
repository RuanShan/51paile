# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AuctionsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "auction_#{params[:room]}"
    #stream_for Spree::Auction.friendly.find params[:room]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
