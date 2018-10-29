class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy


  def add_product_to_cart(product)
    @item = self.cart_items.where("product_id = ?", product.id).first
    if @item
      @item.quantity += 1
      @item.save
    else
      @item = self.cart_items.new(product_id: product.id, quantity: 1)
      @item.save
      product.purchase
    end
  end

  def total_price
    cart_items.map{|item| item.quantity * item.product.price.to_i}.sum
  end

  def clean
    self.cart_items.delete_all
  end
end
