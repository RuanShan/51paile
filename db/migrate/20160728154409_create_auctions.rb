class CreateAuctions < ActiveRecord::Migration
  def self.up
    create_table :spree_auctions do |t|
      t.boolean :private, :default => 0, :null => false
      t.boolean :active, :default => true
      t.integer :status, :default => 0, :null => false
      t.references :variant, :default => 0, :null => false
      t.references :owner, :default => 0, :null => false
      t.references :won_offer
      t.string :title, :length => 50, :null => false, :default => ''
      t.text :description, :length => 2000, :null => false, :default => ''
      t.boolean :highlight, :default => 0
      t.datetime :starts_at
      t.datetime :ends_at

      t.datetime :display_starts_at
      t.datetime :display_ends_at

      t.integer :evaluated_price, :default=>0   #评估价
      t.integer :starting_price, :default=>0    #起拍价
      t.integer :price_increment, :default=>0   #加价幅度
      t.integer :reserve_price, :default=>0     #保留价
      t.integer :deposit, :default=>5000        #拍卖保证金
      #t.integer :delay_period #延时周期
      #t.integer :auction_type, :default=>0 #拍卖规则 0：倒计时出价， 1：一口价，
      #t.integer :auction_mall, :default=>0   #拍卖厅， 0:倒计时出价大厅   1:vip,

      t.integer :offers_count, :default => 0
      t.integer :visits, :default => 0, :null => false

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :spree_auctions
  end
end
