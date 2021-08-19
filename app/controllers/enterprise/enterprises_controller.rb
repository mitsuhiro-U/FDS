class Enterprise::EnterprisesController < ApplicationController

  before_action :authenticate_enterprise!

  def show
    @enterprise = current_enterprise
    @users = @enterprise.followings.all
  end

  def edit
    @enterprise = current_enterprise
  end

  def update
    enterprise = current_enterprise
    enterprise.update(enterprise_params)
    redirect_to enterprise_enterprises_path
  end

  def business_content
    @enterprise = current_enterprise
  end

  def business_content_update
    enterprise = current_enterprise
    enterprise.update(business_content_params)
    redirect_to enterprise_enterprises_path
  end

  def user_search
    @users = User.all
  end

  def search_result
    @users = User.where(
      "(specialized_field = ?)  and (number >= ?)  and (manufacturing_status >= ?)  and (purchasing_status >= ?)  and
      (quality_management_status >= ?) and (food_labeling_status >= ?) and (management_status >= ?)and (is_active = ?)",
      params[:user][:specialized_field],params[:user][:number],params[:user][:manufacturing_status],params[:user][:purchasing_status],
      params[:user][:quality_management_status],params[:user][:food_labeling_status],params[:user][:management_status],true
    ).page(params[:page]).per(5)
  end

  def withdrawal
  end

  def withdrawal_update
    enterprise = current_enterprise
    enterprise.update(is_active: false)
    reset_session
    redirect_to enterprise_top_path, notice: "退会処理が完了しました"
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

  def enterprise_params
    params.require(:enterprise).permit(:name, :name_kana, :established, :capital, :annual_sales, :president, :email)
  end

end
