# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AuctionsChannel < ApplicationCable::Channel
  def subscribed
    #stream_from "auction_#{params[:room]}"
    stream_for Spree::Auction.friendly.find params[:room]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def bid( data )
    Rails.logger.debug "bid data = #{data}, params = #{params} "
    @auction  = Spree::Auction.friendly.find( params[:room])
    AuctionsChannel.broadcast_to(
      @auction,
      ChannelNotifications::Auction.bid( auction )      
    )
  end
end
