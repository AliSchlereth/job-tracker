class DashboardController < ApplicationController

  def index
    @interest_count = Job.count_by_interest
    @top_3_companies = Company.top_three_companies_by_interest
    @count_by_location = Company.count_by_location
  end

end
