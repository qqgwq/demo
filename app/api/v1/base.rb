module V1
  class Base < Grape::API
    mount V1::Products
    mount V1::CartItems
    mount V1::Orders
  end
end