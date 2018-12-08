module V1
  class CartItems < Grape::API
    get 'all_cart_items' do
      @cart_items = CartItem.all
      present @cart_items, with: V1::Entities::CartItem
    end
  end
end