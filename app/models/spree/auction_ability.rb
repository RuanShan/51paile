module Spree
  class AuctionAbility
    include CanCan::Ability

    def initialize(user)
      if user.persisted?
        can :apply, Auction
        can :bid, Auction
      end

    end
  end
end
