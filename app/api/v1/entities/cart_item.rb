module V1
  module Entities
    class CartItem < Grape::Entity
      format_with(:iso_timestamp) do |date|
        date.iso8601
      end
      expose :quantity, documentation: {type: 'Interge', desc: 'cart item quantity'}
      expose :product, using: V1::Entities::Product

      with_options(format_with: :iso_timestamp) do
        expose :created_at
        expose :updated_at
      end
    end
  end
end