class Enterprise::UsersController < ApplicationController

  def show
  end

  def index
     @users = User.page(params[:page]).per(5)
  end

end
