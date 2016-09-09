module Spree
  module ChannelAuction
    extend ActiveSupport::Concern

    included do
      class_attribute :channel_attribute_names
      channel_attribute_names = [:status, :number, :current_price, :channel_bids]
    end

    def channel_attributes
      atts = {}
      channel_attribute_names.each{|key|
        atts[key] = self.send key
      }
      atts
    end

    def channel_bids
      bids.collect{| bid |
         bid.channel_attributes
      }
    end
  end

end
