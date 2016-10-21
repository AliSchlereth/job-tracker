class DashboardController < ApplicationController

  def index
    @jobs = Jobs.all
    @companies = Company.all
  end

end
