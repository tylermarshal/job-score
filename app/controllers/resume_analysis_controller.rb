class ResumeAnalysisController < ApplicationController

  def show
    @resume_analysis = ResumeAnalysisPresenter.new(current_user, params[:id], params[:resume])
    @resume_analysis.job.update_articles
  end

end
