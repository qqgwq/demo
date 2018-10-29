class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.string :order_address
      t.string :order_phone
      t.string :order_name
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
