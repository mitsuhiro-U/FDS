class User::EnterprisesController < ApplicationController

  before_action :authenticate_user!

  def show
    @enterprise = Enterprise.find(params[:id])
  end

end