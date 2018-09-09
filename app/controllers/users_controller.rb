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
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:info] = "登録成功"
      redirect_to user_path(current_user)
    else
      render 'new'
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
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :user_image)
    end

end
