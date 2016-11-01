class JobsController < ApplicationController

  def index
    if params[:sort] == "interest"
      @jobs = Job.sort_by_interest
    else
      @jobs = Job.all
    end
  end

end
