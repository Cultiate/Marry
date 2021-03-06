class ProjectsController < ApplicationController
  protect_from_forgery except: :destroy

  def new
    @project = Project.new
    @user = User.new
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def show
    @project = Project.find_by(id: params[:id])
    @message = Message.new
    @create_project_user = User.find_by(id: @project.user_id)
    remaining_days
    celebraters_info
    @currentUserEntry= Entry.where(user_id: current_user.id)
    @userEntry= Entry.where(user_id: @project.user_id)
    @currentUserEntry.each do |cu|
      @userEntry.each do |u|
        if cu.room_id == u.room_id && Entry.select(user_id: cu.user_id, user_id: u.user_id, project_id: @project.id).distinct
            @room = Room.create(project_id: params[:id])
            @room_id = @room.id
        elsif cu == nil || u == nil
          @room = Room.create(project_id: params[:id])
          @room_id = @room.id
        else
          @room_entry = Entry.find_by(user_id: @project.user_id, project_id: params[:id])
          @room_id = @room_entry.room_id
        end
      end
    end
  end

  def create
    @project = current_user.projects.new(project_params)
    @project.user_name = current_user.user_name
    @user = current_user
    @user.assign_attributes(user_params)
    @user.save(validate: false)
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
      redirect_to project_url(@project)
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
    if params[:return_id].to_i == 1
      @project_return_title = @project.return_title_1
      @project_return_content = @project.return_content_1
      @project_return_price = @project.return_price_1
      @project_return_image = @project.return_image_1
    elsif params[:return_id].to_i == 2
      @project_return_title = @project.return_title_2
      @project_return_content = @project.return_content_2
      @project_return_price = @project.return_price_2
      @project_return_image = @project.return_image_2
    elsif params[:return_id].to_i == 3
      @project_return_title = @project.return_title_3
      @project_return_content = @project.return_content_3
      @project_return_price = @project.return_price_3
      @project_return_image = @project.return_image_3
    end
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

  def user_params
    params.require(:user).permit(
      :user_name, :email, :password, :password_confirmation,
      :user_image, :provider, :uid,
      :name, :postcode, :prefecture_code, :address, :phonenumber
    )
  end
end
