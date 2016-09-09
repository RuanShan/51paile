class AddBidsCount < ActiveRecord::Migration
  def change
    add_column :spree_auctions,  :bids_count,  :integer
  end
end
