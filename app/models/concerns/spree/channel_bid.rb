module Spree
  module ChannelBid
    extend ActiveSupport::Concern

    included do
      class_attributes :channel_attribute_names
      channel_attribute_names = [:status, :number, :current_price, :channel_bids]
    end

    def channel_attributes
      atts = {}
      channel_attribute_names.each{|key|
        atts[key] = self.send key
      }
      atts
    end

  end

end
