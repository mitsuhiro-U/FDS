class User::UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def skill_sheet_edit
    @user = current_user
  end

  def skill_sheet_update
    user = current_user
    user.update(skill_sheet_params)
    redirect_to users_path
  end

  def desired_condition_edit
    @user = current_user
  end

  def desired_condition_update
    user = current_user
    user.update(desired_condition_params)
    redirect_to users_path
  end

  def self_pr_edit
    @user = current_user
  end

  def self_pr_update
    user = current_user
    user.update(self_pr_params)
    redirect_to users_path
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
