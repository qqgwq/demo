module V1
  class Orders < Grape::API
    get 'all_orders' do
      @orders = Order.all
      present @orders, with: V1::Entities::Order
    end
  end
end