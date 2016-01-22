class Category < ActiveRecord::Base
  has_many :organisations
  
  extend FriendlyId
  friendly_id :name, use: :slugged
end
