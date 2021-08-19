class Enterprise::RelationshipsController < ApplicationController
  before_action :authenticate_enterprise!
  before_action :set_user

  def create
    following = current_enterprise.follow(@user)
    if following.save
      redirect_to enterprise_user_path(@user.id)
    else
      redirect_to enterprise_user_path(@user.id)
    end
  end

  def destroy
    following = current_enterprise.unfollow(@user)
    if following.destroy
      redirect_to enterprise_user_path(@user.id)
    else
      redirect_to enterprise_user_path(@user.id)
    end
  end


  private

  def set_user
    @user = User.find(params[:relationship][:user_id])
  end

end
