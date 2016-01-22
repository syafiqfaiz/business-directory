class AddContactsToOrganisation < ActiveRecord::Migration
  def change
    add_column :organisations, :website, :string
    add_column :organisations, :facebook, :string
    add_column :organisations, :instagram, :string
    add_column :organisations, :twitter, :string
  end
end
