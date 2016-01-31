class Organisation < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :products, dependent: :destroy

  mount_uploader :organisation, OrganisationUploader
  
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [
      :name,
      [:name, :city],
      [:name, :street, :city],
      [:name, :street, :city, :state]
    ]
  end

  validates :user, :name, :email, :street, :postcode, :city, :state, :phone_number, 
  :description, :slug, :category, :organisation, presence: true

  def location
    "#{city.capitalize}, #{state.capitalize} "
  end
end
