module V1
  class Products < Grape::API
    get :products do
      @products = Product.all
      present @products, with: V1::Entities::Product
    end
  end
end