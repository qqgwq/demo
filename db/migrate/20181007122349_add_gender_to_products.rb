class AddGenderToProducts < ActiveRecord::Migration
  def change
    add_column :products, :gender, :integer, default: 0
  end
end
