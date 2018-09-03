class CelebratersController < ApplicationController

  def follow_project
    byebug
    @celebrater = Celebrater.new(user_id: current_user.id, project_id: params[:project_id], return_id: params[:return_id])
    if @celebrater.save
      @project = Project.find_by(id: params[:project_id])
      redirect_to project_path(@project)
    else
      redirect_to root_url
    end
  end
end
