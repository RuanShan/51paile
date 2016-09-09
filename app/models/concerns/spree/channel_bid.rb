module Spree
  module ChannelBid
    extend ActiveSupport::Concern

    included do
      class_attribute :channel_attribute_names
      self.channel_attribute_names = [:price, :status]
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
