class WelcomeController < ApplicationController
  before_action :set_search
  def top
    @projects = Project.all.order("created_at desc")
  end

  def about
  end

  def index
    @search_projects = @search.result.order('updated_at DESC')
  end

  def search
  end

    private
      def search_params
        params.require(:q).permit!
      end

      def set_search
       @search = Project.ransack(params[:q])
      end
end
