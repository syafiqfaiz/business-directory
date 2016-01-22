class Product < ActiveRecord::Base
  belongs_to :organisation
  has_many :taggings
  has_many :tags, through: :taggings

  extend FriendlyId
  friendly_id :name, use: :slugged

end
