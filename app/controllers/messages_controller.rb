class MessagesController < ApplicationController

  def create
    Entry.where(user_id: current_user.id, room_id: params[:message][:room_id])
    @room = Room.create(params.require(:message).permit(:project_id))
    @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id, :to_user_id))
    if @user = User.find_by(id: params[:message][:to_user_id])
      @user
    else
      @user = User.find_by(id: params[:message][:user_id])
    end
    @user.receive_notification
    flash[:success] = "メッセージを送信しました"
    redirect_back(fallback_location: root_path)
  end
end
