class UsersController < ApplicationController

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
      result = @user.save(context: :facebook_login)
      fb = "Facebook"
    else
      @user = User.new(user_params)
      @user.save
    end

    if result
        log_in(@user)
        flash[:success] = "#{fb}ログインしました。"
        redirect_to user_url(@user)
    else
        if fb.present?
          redirect_to root_url
        else
          log_in(@user)
          flash[:success] = "登録成功"
          redirect_to user_url(@user)
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

  private

    def user_params
      params.require(:user).permit(
        :user_name, :email, :password, :password_confirmation, :user_image, :provider, :uid
      )
    end

end
