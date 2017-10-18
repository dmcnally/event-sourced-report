class CreateLastCartRemovals < ActiveRecord::Migration[5.1]
  def change
    create_table :last_cart_removals, id: false do |t|
      t.uuid :cart_id, null: false, primary_key: true
      t.uuid :item_id, null: false
      t.datetime :removed_at, null: false
      t.datetime :order_placed_at
    end
  end
end
