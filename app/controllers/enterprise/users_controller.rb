class Enterprise::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
     @users = User.page(params[:page]).per(5)
  end

end
