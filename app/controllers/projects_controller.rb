class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def edit
  end

  def show
    @project = Project.find_by(user_id: current_user.id)
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      flash[:success] = "プロジェクトが作成されました。"
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:content, :main_image)
  end

end
