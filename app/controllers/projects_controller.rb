class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      flash[:success] = "プロジェクトが作成されました。"
      redirect_to project_url(@project)
    else
      render "new"
    end
  end

  def destroy
  end

  def return_follower_count
    return_follower
    @followers = User.where(follow_project_id: params[:project_id]).where(follow_project_return_id: params[:project_return_id]).count
    @project = Project.find_by(id: params[:project_id])
    redirect_to project_path(@project)
  end

  private

  def project_params
    params.require(:project).permit(:title, :content, :main_image,
      :return_content_1, :return_image_1, :return_title_1, :return_price_1,
      :return_content_2, :return_image_2, :return_title_2, :return_price_2,
      :return_content_3, :return_image_3, :return_title_3, :return_price_3
    )
  end

end
