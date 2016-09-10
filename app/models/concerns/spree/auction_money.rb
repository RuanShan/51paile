module Spree
  module AuctionMoney
    extend ActiveSupport::Concern

    included do
      formatted_money_attributes :evaluated_price, :starting_price, :price_increment, :reserve_price, :deposit, :biddable_price, :current_price
    end

    class_methods do
      def formatted_money_attributes( *attrs )
        attrs.each do |name|
           define_method( "formatted_#{name}" ) do
              format_money send(name).to_money
           end
        end
      end
    end

    #def formatted_starting_price
    #  format_money starting_price.to_money
    #end

    def format_money( money )
      money.format(:no_cents => true, :symbol => false)
    end
  end
end
