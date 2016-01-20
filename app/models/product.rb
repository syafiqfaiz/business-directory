class Product < ActiveRecord::Base
  belongs_to :organisation
  has_many :taggings
  has_many :tags, through: :taggings
end
