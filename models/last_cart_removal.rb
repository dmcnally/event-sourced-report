require_relative '../config/active_record'

class LastCartRemoval < ActiveRecord::Base

  def self.removed_shortly_before_checkout
    where("order_placed_at is not null and (order_placed_at - removed_at) < INTERVAL '3 minutes'")
  end

end
