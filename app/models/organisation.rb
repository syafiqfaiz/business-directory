class Organisation < ActiveRecord::Base
  belongs_to :user
  has_many :products
  
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :name,
      [:name, :city],
      [:name, :street, :city],
      [:name, :street, :city, :state]
    ]
  end
end

