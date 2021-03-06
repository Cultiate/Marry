class RoomsController < ApplicationController

  def create
    @room = Room.create(params.require(:room).permit(:project_id))
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id, :project_id).merge(room_id: @room.id))
    redirect_back(fallback_location: root_path)
  end

  def show
    @room = Room.find_by(id: params[:id])
    @entries = @room.entries
    if Entry.includes(:user).where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
