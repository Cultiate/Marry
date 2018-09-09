module CelebratersHelper

  def celebraters_info
    @celebraters = Celebrater.where(project_id: params[:id])
    @celebraters_count = @celebraters.select(:user_id).distinct.count
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

end
