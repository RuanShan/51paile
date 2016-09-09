Spree::User.class_eval do
  has_many :auction_foregifts
  has_many :biddable_auctions, through: :auction_foregifts, source: :auction
  def biddable?( auction )
    true #biddable_auction_ids.include? auction.id
  end
end
