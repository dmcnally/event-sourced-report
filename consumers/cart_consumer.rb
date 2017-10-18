require 'racecar'
require 'oj'
require_relative '../models/last_cart_removal'

class CartConsumer < Racecar::Consumer
  subscribes_to "#{ENV['KAFKA_PREFIX']}carts", start_from_beginning: true

  def process(message)
    message_value = Oj.load(message.value)

    # skip events that aren't removing items from carts
    return unless message_value['type'] == 'removed_item_from_cart'

    # insert or update the latest removal
    LastCartRemoval.connection.execute <<-SQL
      insert into last_cart_removals (cart_id, product_id, removed_at)
      values ('#{message_value.fetch('cart_id')}', '#{message_value.fetch('product_id')}', '#{message_value.fetch('timestamp')}')
      on conflict (cart_id) do update set product_id = EXCLUDED.product_id, removed_at = EXCLUDED.removed_at
    SQL
  end
end
