class Resumes::JobsController < ApplicationController

  def show
    @user_jobs = current_user.jobs
    @user_resumes = current_user.resumes
    @job = current_user.jobs.find(params[:id])
    @resume = current_user.resumes.find(params[:resume])
    @keywords = EntityComparisonService.compare(@job, @resume)
  end

end
