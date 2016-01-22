class AddCategoryIdToOrganisation < ActiveRecord::Migration
  def change
    add_reference :organisations, :category, index: true, foreign_key: true
  end
end
