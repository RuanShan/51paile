Spree::Product.class_eval do
  include Spree::ProductHasManyAuctions
end


Spree::Variant.class_eval do
  has_many :auctions, dependent: :destroy, class_name: "Spree::Auction"
  has_one :active_auction, ->{ active }, class_name: "Spree::Auction"
end
