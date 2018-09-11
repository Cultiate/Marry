class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        log_in(@user)
        flash[:success] = "ログインしました。"
        redirect_to user_url(@user)
      else
        flash.now[:danger] = "メールアドレス、またはパスワードが違います。"
        render "new"
      end
  end

  def destroy
    log_out
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end
end
