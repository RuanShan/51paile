class Offer < ActiveRecord::Base
  STATUSES = {:won => 2, :active => 1}
  #attr_accessible :price,:auction_id,:day, :offerer_id
  has_many :alerts
  belongs_to :auction, :counter_cache => true
  belongs_to :offerer, :class_name => "User"

  validates :price, :numericality => {:greater_than => 0}
  #validates :days, :numericality => {:only_integer => true, :greater_than => 0}

  scope :normal, -> { where(:status => STATUSES[:active]) }
  scope :won, -> { where(:status => STATUSES[:won]) }
  scope :rejected, -> { where(:status => STATUSES[:rejected]) }
  scope :with_status, ->(status) { where(:status => STATUSES[status]) }
  #default_scope includes(:offerer)

  before_save :default_values, :on => :create

  def to_s
    "#{self.price} PLN / #{self.days} dni (#{self.offerer})"
  end

  def default_values
    self.status = STATUSES[:active] if self.status.nil?
  end

  def reject!
    self.status = STATUSES[:rejected]
    self.save
  end

  def recovery!
    self.status = STATUSES[:active]
    self.save
  end
end
