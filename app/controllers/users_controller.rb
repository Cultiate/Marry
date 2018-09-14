class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    redirect_to root_url
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def show
    @user = User.find_by(id: params[:id])
    @celebrate_datas = Celebrater.where(user_id: params[:id]).order("created_at desc")
  end

  def create
    if request.env['omniauth.auth'].present?
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.save
        @user.update_attribute(:activated, true)
        @user.update_attribute(:activated_at, Time.zone.now)
        log_in(@user)
        fb = "Facebook"
        flash[:success] = "#{fb}ログインしました。"
        redirect_to @user
      end
    else
      @user = User.new(user_params)
      if @user.save
        @user.send_activation_email
        flash[:info] = "確認メールを送信しました。"
        redirect_to root_url
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールが更新されました。"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to root_url unless @user == current_user
  end

  private

    def user_params
      params.require(:user).permit(
        :user_name, :email, :password, :password_confirmation, :user_image, :provider, :uid
      )
    end

end
