class RenameItemIdToProductId < ActiveRecord::Migration[5.1]
  def change
    rename_column :last_cart_removals, :item_id, :product_id
  end
end
