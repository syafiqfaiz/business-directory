class AddOrganisationToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :organisation, :string
  end
end
