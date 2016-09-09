module Spree
  class Bid < ActiveRecord::Base
    belongs_to :auction
    enum status: { active: 0,  rejected: 7, won:2 }
    #attr_accessible :price,:auction_id,:day, :offerer_id
    has_many :alerts
    belongs_to :auction, :counter_cache => true
    belongs_to :bidder, :class_name => "Spree::User"
    belongs_to :auction_foregift, ->{ where( auction_id: auction_id, user_id: bidder_id).paid }, class_name: "Spree::AuctionForegift"

    validates :price, :numericality => {:greater_than => 0}
    #validates :days, :numericality => {:only_integer => true, :greater_than => 0}

    def to_s
      "#{self.price} PLN / #{self.days} dni (#{self.offerer})"
    end

    def bidder_number

      auction_foregifts
    end

  end
end
