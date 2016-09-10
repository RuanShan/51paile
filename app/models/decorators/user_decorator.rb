Spree::User.class_eval do
  has_many :auction_foregifts
  has_many :bids, foreign_key: :bidder_id
  has_many :biddable_auctions, through: :auction_foregifts, source: :auction

  def biddable?( auction )
    biddable_auction_ids.include? auction.id
  end

  def auction_bids( auction )
    bids.where( auction: auction )
  end

  def auction_bid_count( auction )
    auction_bids( auction ).count
  end

  def auction_foregift( auction )
    auction_foregifts.where( auction: auction ).first
  end

end
