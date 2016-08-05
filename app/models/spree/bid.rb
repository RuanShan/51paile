module Spree
  class Bid < ActiveRecord::Base
    belongs_to :auction
    enum status: { active: 0,  rejected: 7, won:2 }
    STATUSES = {:won => 2, :active => 1, :rejected=> 9}
    #attr_accessible :price,:auction_id,:day, :offerer_id
    has_many :alerts
    belongs_to :auction, :counter_cache => true
    belongs_to :offerer, :class_name => "Spree::User"

    validates :price, :numericality => {:greater_than => 0}
    #validates :days, :numericality => {:only_integer => true, :greater_than => 0}

    scope :normal, -> { where(:status => STATUSES[:active]) }
    scope :won, -> { where(:status => STATUSES[:won]) }
    scope :rejected, -> { where(:status => STATUSES[:rejected]) }
    scope :with_status, ->(status) { where(:status => STATUSES[status]) }
    #default_scope includes(:offerer)



    def to_s
      "#{self.price} PLN / #{self.days} dni (#{self.offerer})"
    end


  end
end
