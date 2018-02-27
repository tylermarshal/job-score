class ResumeAnalysisController < ApplicationController

  def show
    @user_jobs = current_user.jobs
    @user_resumes = current_user.resumes
    if params[:id] && params[:resume]
      @job = current_user.jobs.find(params[:id])
      @resume = current_user.resumes.find(params[:resume])
    else
      @job = @user_jobs.first
      @resume = @user_resumes.first
    end
    @keywords = EntityComparisonService.compare(@job, @resume)
    @percentage = EntityComparisonService.percentage(@job, @resume)
  end

end
