class Product < ActiveRecord::Base
  belongs_to :organisation
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  attr_accessor :tag_input

  mount_uploaders :product, ProductUploader

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :name, :description, :price, :organisation, :slug, :product, presence: true

end