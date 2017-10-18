require 'racecar'
require 'oj'
require_relative '../models/last_cart_removal'

class OrderConsumer < Racecar::Consumer
  subscribes_to "#{ENV['KAFKA_PREFIX']}orders", start_from_beginning: true

  def process(message)
    message_value = Oj.load(message.value)

    # insert or update the latest removal
    LastCartRemoval.connection.execute <<-SQL
      update last_cart_removals
      set order_placed_at = '#{message_value.fetch('timestamp')}'
      where cart_id = '#{message_value.fetch('cart_id')}'
    SQL
  end
end
