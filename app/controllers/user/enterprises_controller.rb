class User::EnterprisesController < ApplicationController

  def show
    @enterprise = Enterprise.find(params[:id])
  end
  
end