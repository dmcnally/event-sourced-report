require 'sinatra'
require 'rack/ssl'

require_relative 'models/last_cart_removal'

configure :production do
  use Rack::SSL
end

configure do
  set :server, :puma
end

get '/' do
  erb :index, locals: {
    last_cart_removals: LastCartRemoval.removed_shortly_before_checkout.order('order_placed_at desc')
  }
end
