class DashboardController < ApplicationController

  def index
    @interest_count = Job.sort_by_interest
  end

end
