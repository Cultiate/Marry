class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def show
    @project = Project.find_by(id: params[:id])
    remaining_days
    celebraters_info
  end

  def create
    @project = current_user.projects.new(project_params)
    @project.user_name = current_user.user_name
    if @project.save
      flash[:success] = "プロジェクトが作成されました。"
      redirect_to project_url(@project)
    else
      render "new"
    end
  end

  def update
    @project = Project.find_by(id: params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "プロジェクトが更新されました"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
  end

  def follow_project
    @celebrater = Celebrater.new(
      user_id: current_user.id,
      project_id: params[:project_id],
      return_id: params[:return_id],
      return_price: params[:return_price]
    )
    @project = Project.find_by(id: params[:project_id])
    if @celebrater.save
      redirect_to project_thanks_url(@project, return_id: params[:return_id])
    else
      redirect_to root_url
    end
  end

  def celebrate
    @project = Project.find_by(id: params[:id])
    remaining_days
    celebraters_info
  end

  def project_confirm
    @project = Project.find_by(id: params[:id])
  end

  def return_confirm
    @project = Project.find_by(id: params[:id])
    @return = Celebrater.find_by(project_id: params[:id], return_id: params[:return_id])
    remaining_days
    celebraters_info
  end

  def thanks
    @project = Project.find_by(id: params[:id])
  end

  def confirm
    @project = Project.find_by(id: params[:id])
  end

  private

  def project_params
    params.require(:project).permit(
      :title, :content, :main_image, :user_name, :end_date, :display,
      :return_content_1, :return_image_1, :return_title_1, :return_price_1,
      :return_content_2, :return_image_2, :return_title_2, :return_price_2,
      :return_content_3, :return_image_3, :return_title_3, :return_price_3
    )
  end

end
