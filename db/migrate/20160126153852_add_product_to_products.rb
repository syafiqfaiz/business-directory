class AddProductToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product, :json
  end
end
