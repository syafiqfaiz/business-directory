class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:show]
  before_action :authenticate_owner, only: [:edit, :update, :destroy]


  def show
    @categories = Category.all
    if @organisation.category
      @companies = @organisation.category.organisations.limit(3).order('RANDOM()')
    else
      @companies = Organisation.limit(3).order('RANDOM()')
    end
  end

  def new
    @organisation = Organisation.new
  end

  def edit
  end

  def create
    @organisation = current_user.organisations.new(organisation_params)

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to @organisation, notice: 'Organisation was successfully created.' }
        format.json { render :show, status: :created, location: @organisation }
      else
        format.html { render :new }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to @organisation, notice: 'Organisation was successfully updated.' }
        format.json { render :show, status: :ok, location: @organisation }
      else
        format.html { render :edit }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organisation.destroy
    respond_to do |format|
      format.html { redirect_to managers_path, notice: 'Organisation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def authenticate_owner
      redirect_to sign_in_path unless @organisation.user_id == current_user.id
    end

    def set_organisation
      @organisation = Organisation.friendly.find(params[:id])
    end


    def organisation_params
      params.require(:organisation).permit(:name, :email, :street, :city, :postcode, :state, :phone_number, :description, :website, :facebook, :instagram, :twitter, :organisation)
    end
end


