class CelebratersController < ApplicationController

  def follow_project
    @celebrater = Celebrater.new(user_id: current_user.id, project_id: params[:project_id], return_id: params[:return_id], return_price: params[:return_price])
    @project = Project.find_by(id: params[:project_id])
    if @celebrater.save
      redirect_to project_path(@project)
    else
      redirect_to root_url
    end
  end
end
