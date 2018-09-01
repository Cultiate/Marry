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

  private

  def project_params
    params.require(:project).permit(:content, :main_image)
  end

end
