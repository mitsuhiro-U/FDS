class User::UsersController < ApplicationController

  def show
    @rooms = current_user.rooms
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(is_active: false)
    reset_session
    redirect_to top_path
  end

  def skill_sheet_edit
    @user = current_user
  end

  def skill_sheet_update
    user = current_user
    if user.update(skill_sheet_params)
      flash[:notice] = "スキル表を更新しました"
    end
    redirect_to users_path
  end

  def desired_condition_edit
    @user = current_user
  end

  def desired_condition_update
    user = current_user
    if user.update(desired_condition_params)
      flash[:notice] = "希望条件を更新しました"
    end
    redirect_to users_path
  end

  def self_pr_edit
    @user = current_user
  end

  def self_pr_update
    user = current_user
    if user.update(self_pr_params)
      flash[:notice] = "自己PRを更新しました"
    end
    redirect_to users_path
  end

  def followers
    @user = current_user
    @enterprises = @user.followers.all
  end

  private

  def skill_sheet_params
    params.require(:user).permit(
      :specialized_field, :number, :manufacturing_status, :purchasing_status, :quality_management_status,
      :food_labeling_status, :management_status, :notice
    )
  end

  def desired_condition_params
    params.require(:user).permit(:desired_salary, :preferred_workplace, :desired_field, :timing, :request)
  end

  def self_pr_params
    params.require(:user).permit(:job_career, :job_summary)
  end

end
