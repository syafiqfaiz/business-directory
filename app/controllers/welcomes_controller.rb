class WelcomesController < ApplicationController
  def index
    @categories = all_categories
    @latest_products = Product.limit(6).order('RANDOM()').includes(:tags)
    @latest_companies = Organisation.limit(4).order('RANDOM()').includes(:category)
    @featured_product = Product.limit(1).order('RANDOM()').includes(:organisation).first
  end
end
