class WelcomeController < ApplicationController
  def top
    @projects = Project.all.order("created_at desc")
    # @projectsss.each do |project|
    #   @counts_1 = project.celebraters.select(:user_id).distinct.order(:user_id).count
    # end
  end

  def about
  end
end
