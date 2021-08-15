class Enterprise::RelationshipsController < ApplicationController

  before_action :set_user

  def create
    following = current_enterprise.follow(@user)
    if following.save
      flash[:success] = "ユーザーをフォローしました"
      redirect_to enterprise_user_path(@user.id)
    else
      flash.now[:alert] = "ユーザーのフォローに失敗しました"
      redirect_to enterprise_user_path(@user.id)
    end
  end

  def destroy
    following = current_enterprise.unfollow(@user)
    if following.destroy
      flash[:success] = "ユーザーのフォローを解除しました"
      redirect_to enterprise_user_path(@user.id)
    else
      flash.now[:alert] = "ユーザーのフォロー解除に失敗しました"
      redirect_to enterprise_user_path(@user.id)
    end
  end


  private

  def set_user
    @user = User.find(params[:relationship][:user_id])
  end

end
