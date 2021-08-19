class Enterprise::UsersController < ApplicationController

  before_action :authenticate_enterprise!

  def show
    @user = User.find(params[:id])
    @relationship = current_enterprise.relationships.find_by(user_id: @user.id)
    @set_relationship = current_enterprise.relationships.new
  end

  def index
     @users = User.where(is_active: "true").page(params[:page]).per(5)
  end

end
