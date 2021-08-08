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
  end

  def desired_condition_update
  end

  def self_pr_edit
  end

  def self_pr_update
  end

  private

  def skill_sheet_params
    params.require(:user).permit(
      :specialized_field, :number, :manufacturing_status, :purchasing_status, :quality_management_status,
      :food_labeling_status, :management_status, :notice
    )
  end

end
