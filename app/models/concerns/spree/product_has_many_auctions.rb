module Spree
  module ProductHasManyAuctions
    extend ActiveSupport::Concern

    included do
      has_many :variant_auctions, source: :auctions, through: :variants_including_master
      has_many :auctions # for simple, add product_id into auctions
      has_one :active_auction, ->{  active }, class_name: "Spree::Auction"
    end
  end

end
