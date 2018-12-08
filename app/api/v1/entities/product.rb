module V1
  module Entities
    class Product < Grape::Entity
      expose :name, documentation: {type: 'String', desc: 'product name'}
      expose :price, documentation: {type: 'String', desc: 'product price'}
      expose :state, documentation: {type: 'String', desc: 'product status'}
    end
  end
end