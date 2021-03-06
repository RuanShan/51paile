module Spree
  module Admin
    class AuctionsController < Spree::Admin::ResourceController

      before_action :load_edit_data, except: :index
      before_action :load_index_data, only: :index

      belongs_to 'spree/product', :find_by => :slug

      private

      def location_after_destroy
        admin_product_auctions_url(@product)
      end

      def location_after_save
        admin_product_auctions_url(@product)
      end

      def load_index_data
        @product = Product.friendly.find(params[:product_id])
      end

      def load_edit_data
        @product = Product.friendly.find(params[:product_id])
        @variants = @product.variants.map do |variant|
          [variant.sku_and_options_text, variant.id]
        end
        @variants.insert(0, [Spree.t(:all), @product.master.id])
      end

      def variant_index_includes
        [
          :variant_auctions
        ]
      end

      def variant_edit_includes
        [
          :variants_including_master
        ]
      end

      def find_resource
          parent.send(controller_name).friendly.find(params[:id])
      end

    end
  end
end
