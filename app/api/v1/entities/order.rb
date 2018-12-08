module V1
  module Entities
    class Order < Grape::Entity
      expose :contact_info do
        expose :order_address
        expose :order_phone
        expose :order_name
      end
    end
  end
end