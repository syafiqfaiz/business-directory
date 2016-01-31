require "administrate/base_dashboard"

class OrganisationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    category: Field::BelongsTo,
    products: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    email: Field::String,
    street: Field::String,
    postcode: Field::String,
    city: Field::String,
    state: Field::String,
    phone_number: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    description: Field::Text,
    website: Field::String,
    facebook: Field::String,
    instagram: Field::String,
    twitter: Field::String,
    slug: Field::String,
    organisation: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :category,
    :products,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :category,
    :products,
    :id,
    :name,
    :email,
    :street,
    :postcode,
    :city,
    :state,
    :phone_number,
    :created_at,
    :updated_at,
    :description,
    :website,
    :facebook,
    :instagram,
    :twitter,
    :slug,
    :organisation,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :category,
    :products,
    :name,
    :email,
    :street,
    :postcode,
    :city,
    :state,
    :phone_number,
    :description,
    :website,
    :facebook,
    :instagram,
    :twitter,
    :slug,
    :organisation,
  ]

  # Overwrite this method to customize how organisations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(organisation)
  #   "Organisation ##{organisation.id}"
  # end
end
