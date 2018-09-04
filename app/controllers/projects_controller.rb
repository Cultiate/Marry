class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def show
    @project = Project.find_by(id: params[:id])
    @celebraters = Celebrater.where(project_id: params[:id])
    @celebraters_count = @celebraters.count
    @total_celebraters_price = @celebraters.sum(:return_price)

    if @celebraters
      @celebraters
    else
      @celebraters = 0
    end
    @following_return_1 = Celebrater.where(project_id: params[:id]).where(return_id: 1).count
    @following_return_2 = Celebrater.where(project_id: params[:id]).where(return_id: 2).count
    @following_return_3 = Celebrater.where(project_id: params[:id]).where(return_id: 3).count
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

  def follow_project
    @celebrater = Celebrater.new(user_id: current_user.id, project_id: params[:project_id], return_id: params[:return_id], return_price: params[:return_price])
    @project = Project.find_by(id: params[:project_id])
    if @celebrater.save
      redirect_to project_path(@project)
    else
      redirect_to root_url
    end
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
