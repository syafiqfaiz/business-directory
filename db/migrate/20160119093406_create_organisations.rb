class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.string :email
      t.string :address
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
