class WelcomeController < ApplicationController
  def top
    @projects = Project.all.order("created_at desc")
  end

  def about
  end
end
