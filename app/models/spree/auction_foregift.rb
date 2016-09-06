module Spree
  class AuctionForegift < ActiveRecord::Base

    FOREGIFT_STATES = %w(checkout failed paid void)
    include Spree::Core::NumberGenerator.new(prefix: 'P', letters: true, length: 7)

    extend FriendlyId
    friendly_id :number, slug_column: :number, use: :slugged

    belongs_to :user
    belongs_to :auction
    belongs_to :payment_method

    alias_attribute :total, :amount # for alipay provider

    state_machine initial: :checkout do
      event :complete do
        transition from: [:checkout], to: :paid
      end
      event :failure do
        transition from: [:checkout], to: :failed
      end
    end
  end
end
