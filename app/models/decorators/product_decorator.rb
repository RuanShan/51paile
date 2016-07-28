Spree::Product.class_eval do
  include Spree::ProductHasManyAuctions
end


Spree::Variant.class_eval do
  has_many :auctions, dependent: :destroy, class_name: "Spree::Auction"
end
