class AddProductTitle < ActiveRecord::Migration[5.1]
  def up
    execute 'delete from last_cart_removals'
    add_column :last_cart_removals, :product_title, :string, null: false
  end

  def down
    remove_column :last_cart_removals, :product_title
  end
end
