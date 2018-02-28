class CoverLetterAnalysisController < ApplicationController

  def show
    @user_jobs = current_user.jobs
    @user_cover_letters = current_user.cover_letters
    if params[:id] && params[:cover_letters]
      @job = current_user.jobs.find(params[:id])
      @cover_letter = current_user.cover_letters.find(params[:cover_letter])
    else
      @job = @user_jobs.first
      @cover_letter = @user_cover_letters.first
    end
    @keywords = EntityComparisonService.compare(@job, @cover_letter)
    @percentage = EntityComparisonService.percentage(@job, @cover_letter)
  end

end
