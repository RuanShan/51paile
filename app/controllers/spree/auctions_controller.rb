module Spree

  class AuctionsController <  StoreController
    before_action :load_object, only: [:apply,:bid]

    def index
    end


    def by_type
    end

    def bid
      bid = @auction.bids.build( bidder: @user ) do|bid|
        bid.price = params[:price].to_i
      end

      bid.save!

      AuctionsChannel.broadcast_to(
        @auction,
        @auction.channel_attributes
      )

    end

    def apply
       @payment_method = Spree::Gateway::AlipayWap.active.first
    end

    private

    def load_object
      @auction = Auction.friendly.find( params[:id] )
      @user ||= spree_current_user
      authorize! params[:action].to_sym, @user
    end

  end
end
