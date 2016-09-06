class AddAuctionNumber < ActiveRecord::Migration
  def change
    add_column :spree_auctions,  :number,   :string,             :limit => 15
    add_column :spree_auctions,  :product_id,  :integer
    add_index :spree_auctions, [:number], :name => 'index_spree_auctions_on_number'

    add_column :spree_auction_foregifts,  :number,   :string,             :limit => 15
    add_index :spree_auction_foregifts, [:number], :name => 'index_spree_auction_foregifts_on_number'
  end
end
