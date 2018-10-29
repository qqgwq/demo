class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items

  before_create :order_number
  enum status: ["New", "Complete", "Refund"]

  def add_item(cart)
    cart.cart_items.each do |item|
      self.order_items.build(:product_id => item.product_id,
                             :quantity => item.quantity,
                             :price => item.product.price)
    end
  end

  def order_number
    self.uuid = SecureRandom.hex(10)
  end
end
