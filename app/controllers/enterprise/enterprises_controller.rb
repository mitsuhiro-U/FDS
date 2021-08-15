class Enterprise::EnterprisesController < ApplicationController

  def show
    @enterprise = current_enterprise
    @users = @enterprise.followings.all
  end

  def edit
    @enterprise = current_enterprise
  end

  def update
    enterprise = current_enterprise
    enterprise.update(business_content_params)
    redirect_to enterprise_business_content_path
  end

  def business_content
  end

  def business_content_update
  end

  def user_search
    @user = User.all
  end

  def search_result
    @users = User.where(
      "(specialized_field = ?)  and (number >= ?)  and (manufacturing_status >= ?)  and (purchasing_status >= ?)  and
      (quality_management_status >= ?) and (food_labeling_status >= ?) and (management_status >= ?)",
      params[:user][:specialized_field],params[:user][:number],params[:user][:manufacturing_status],params[:user][:purchasing_status],
      params[:user][:quality_management_status],params[:user][:food_labeling_status],params[:user][:management_status]
    )
  end

  def withdrawal
  end

  def withdrawal_up
  end

  private

  def search_params
    params.require(:user).permit(
      :specialized_field, :number, :manufacturing_status, :purchasing_status, :quality_management_status,
      :food_labeling_status, :management_status
    )
  end
  
  def business_content_params
    params.require(:enterprise).permit(:business_content)
  end
  
end
