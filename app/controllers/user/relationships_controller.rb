class User::RelationshipsController < ApplicationController
  
  before_action :set_enterprise

  def create
    following = current_user.follow(@enterprise)
    if following.save
      flash[:success] = "企業様にフォローを返しました。"
      redirect_to @user
    else
      flash.now[:alert] = "企業様のフォローに失敗しました"
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@enterprise)
    if following.destroy
      flash[:success] = "企業様のフォローを解除しました"
      redirect_to @user
    else
      flash.now[:alert] = "企業様のフォロー解除に失敗しました"
      redirect_to @user
    end
  end


  private
  
  def set_enterprise
    @enterprise = Enterprise.find(params[:relationship][:enterprise_id])
  end
  
end
