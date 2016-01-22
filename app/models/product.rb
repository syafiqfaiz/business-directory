class Product < ActiveRecord::Base
  belongs_to :organisation
  has_many :taggings
  has_many :tags, through: :taggings

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :name,
      [:name, :organisation]
    ]
  end

  def organisation
    self.organisation.name
  end
end
