class CreateBids < ActiveRecord::Migration
  def self.up
    create_table :spree_bids do |t|
      t.belongs_to :auction, index: true, foreign_key: true, null: false
      t.belongs_to :bidder, index: true, foreign_key: true, null: false
      t.boolean :winner, default: false
      t.decimal :price, null: false
      t.integer :status, null: false, default: 0
      t.timestamps null: false
    end
  end

  def self.down
    drop_table(:spree_bids)
  end
end
