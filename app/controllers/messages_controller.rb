class MessagesController < ApplicationController

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id, :to_user_id).merge(user_id: current_user.id))
      redirect_to "/rooms/#{@message.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
    @user = User.find_by(id: params[:message][:to_user_id])
    @user.receive_notification
    flash[:success] = "メッセージを送信しました"
  end
end
