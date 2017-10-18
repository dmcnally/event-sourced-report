class ChangeProductIdToString < ActiveRecord::Migration[5.1]
  def up
    change_column :last_cart_removals, :product_id, :string, null: false
  end

  def down
    change_column :last_cart_removals, :product_id, :uuid, null: false
  end
end
