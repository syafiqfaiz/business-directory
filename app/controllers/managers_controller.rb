class ManagersController < ApplicationController
  before_action :require_login
  before_action :organisation, only: :show

  def index
    @organisations = current_user.organisations.includes(:products)
  end

  def show

  end

  private
  def organisation
    @organisation = Organisation.includes(:products).friendly.find(params[:id])
  end

end
