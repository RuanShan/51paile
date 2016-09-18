class AddDeletedAtToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_auctions, :deleted_at, :datetime
    add_index :spree_auctions, :deleted_at
    add_index :spree_auctions, [:status, :starts_at]
  end
end
