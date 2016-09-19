class AddSpreeProductsType < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_products, :type, :string

    add_column :spree_variants,  :starts_at, :datetime
    add_column :spree_variants,  :ends_at, :datetime

    #available_on, discontinue_on
    #add_column :spree_variants,  :display_starts_at, :datetime
    #add_column :spree_variants,  :display_ends_at, :datetime

    add_column :spree_variants,  :evaluated_price, :integer,  :default=>0   #评估价
    add_column :spree_variants,  :starting_price, :integer, :default=>0    #起拍价
    add_column :spree_variants,  :price_increment, :integer, :default=>0   #加价幅度
    add_column :spree_variants,  :reserve_price, :integer, :default=>0     #保留价
    add_column :spree_variants,  :deposit, :integer, :default=>0        #拍卖保证金
    add_column :spree_variants,  :offers_count, :integer, :default=>0
    add_column :spree_variants,  :status, :integer, :default=>0

  end
end
