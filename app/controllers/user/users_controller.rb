class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :self_pr_check, only: [:self_pr_update]
  before_action :desired_condition_check, only: [:desired_condition_update]
  before_action :skill_sheet_check, only: [:skill_sheet_update]

  def show
    @rooms = current_user.rooms
  end

  def index
    redirect_to new_user_registration_path
  end

  def withdrawal
  end

  def withdrawal_update
    user = current_user
    user.update(is_active: false)
    reset_session
    redirect_to top_path, notice: "退会処理が完了しました"
  end

  def skill_sheet_edit
    @user = current_user
  end

  def skill_sheet_update
    if @user.errors.blank?
      @user.update(skill_sheet_params)
      flash[:notice] = "希望条件を更新しました"
      redirect_to user_mypage_path
    else
      flash[:alert] = "入力必須項目が入力されていません"
      render :skill_sheet_edit
    end
  end

  def desired_condition_edit
    @user = current_user
  end

  def desired_condition_update
    if @user.errors.blank?
      @user.update(desired_condition_params)
      flash[:notice] = "希望条件を更新しました"
      redirect_to user_mypage_path
    else
      flash[:alert] = "入力必須項目が入力されていません"
      render :desired_condition_edit
    end
  end

  def self_pr_edit
    @user = current_user
  end

  def self_pr_update
    if @user.errors.blank?
      @user.update(self_pr_params)
      flash[:notice] = "自己PRを更新しました"
      redirect_to user_mypage_path
    else
      flash[:alert] = "入力必須項目が入力されていません"
      render :self_pr_edit
    end
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
#------------フォームのバリテーションとしての定義----------------------------------------
  def self_pr_check
    @user = current_user
    @user.errors.add :job_carrer, "blank" if params["user"]["job_career"].blank?
    @user.errors.add :job_summary, "blank" if params["user"]["job_summary"].blank?
  end

  def desired_condition_check
    @user = current_user
    @user.errors.add :desired_salary, "blank" if params["user"]["desired_salary"].blank?
    @user.errors.add :job_summary, "blank" if params["user"]["preferred_workplace"].blank?
  end

  def skill_sheet_check
    @user = current_user
    @user.errors.add :specialized_field, "blank" if params["user"]["specialized_field"].blank?
    @user.errors.add :manufacturing_status, "blank" if params["user"]["manufacturing_status"].blank?
    @user.errors.add :purchasing_status, "blank" if params["user"]["purchasing_status"].blank?
    @user.errors.add :quality_management_status, "blank" if params["user"]["quality_management_status"].blank?
    @user.errors.add :food_labeling_status, "blank" if params["user"]["food_labeling_status"].blank?
    @user.errors.add :management_status, "blank" if params["user"]["management_status"].blank?
  end
#----------------------------------------------------------------------------------------

end
