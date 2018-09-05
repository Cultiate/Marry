module ProjectsHelper

  def remaining_days
    today = Date.today
    @remaining_days = ((@project.end_date - today).to_i - 1)
  end
end
