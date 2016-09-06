class CreateAuctionForegifts < ActiveRecord::Migration
  def change
    create_table :spree_auction_foregifts do |t|
      t.references :user
      t.references :auction
      t.references :payment_method
      t.string :state
      t.decimal :amount,    precision: 10, scale: 2, default: 0.0, null: false

      t.timestamps null: false
    end
  end
end
