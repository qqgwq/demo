class AddAncestryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ancestry, :string
    add_index :products, :ancestry
  end
end
