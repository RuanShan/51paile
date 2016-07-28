module Spree
  module ProductHasManyAuctions
    extend ActiveSupport::Concern

    included do
      has_many :variant_auctions, source: :auctions, through: :variants_including_master
    end
  end

end
