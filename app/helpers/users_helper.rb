module UsersHelper

  def return_follower
    @user = User.find_by(id: current_user.id)
    @user.update_attributes(follow_project_id: params[:project_id], follow_project_return_id: params[:follow_project_return_id])
  end
end
