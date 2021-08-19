class User::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_enterprise

  def create
    following = current_user.follow(@enterprise)
    if following.save
      redirect_to @user
    else
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@enterprise)
    if following.destroy
      redirect_to @user
    else
      redirect_to @user
    end
  end


  private

  def set_enterprise
    @enterprise = Enterprise.find(params[:relationship][:enterprise_id])
  end

end
