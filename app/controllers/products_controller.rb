class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]
  before_action :set_organisation, only: [ :index, :new, :create, :edit, :update]
  before_action :authenticate_owner, only: [:edit, :update, :destroy]
  
  def index
    @products = @organisation.products
    @companies =  Organisation.limit(4).order('RANDOM()')
    @categories = Category.all
  end

  def show
    @categories = Category.all
    if @product.tags.any?
      @related_tags = @product.tags
      @related_products = @related_tags.sample.products.first(5)
    else
      @related_products = Tag.all.sample.products.first(5)
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = @organisation.products.new(product_params)

    respond_to do |format|
      if @product.save
        tagging
        format.html { redirect_to organisation_product_path(@organisation.slug, @product.slug), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to organisation_product_path(@organisation.slug, @product.slug), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organisation = @product.organisation
    @product.destroy
    respond_to do |format|
      format.html { redirect_to manager_path(@organisation.slug), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def tagging
      tags = params[:product][:tag_input].split(',').map!{|x| x.strip}
      tags.each do |tag|
        Tag.find_or_create_by(name: tag).products << @product
      end
    end

    def authenticate_owner
      redirect_to sign_in_path ,notice: 'No permission' unless @product.organisation.user_id == current_user.id
    end

    def set_product
      @product = Product.friendly.find(params[:id])
    end

    def set_organisation
      @organisation = Organisation.friendly.find(params[:organisation_id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, {product: []})
    end
    
end
