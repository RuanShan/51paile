Spree::User.class_eval do
  has_many :auction_foregifts
  has_many :biddable_auctions, through: :auction_foregifts, source: :auction

  def biddable?( auction )
    biddable_auction_ids.include? auction.id
  end

  def auction_foregift( auction )
    auction_foregifts.where( auction: auction ).first
  end
  
end
