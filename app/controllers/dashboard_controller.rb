class DashboardController < ApplicationController

  def index
    if logged_in?
      if params[:notice] == "resume"
        flash.notice = "Please add at least one resume and one job to complete a resume analysis."
      elsif params[:notice] == "cover_letter"
        flash.notice = "Please add at least one cover letter and one job to complete a cover letter analysis."
      end
      @resume = Resume.new
      @cover_letter = CoverLetter.new
      @job = Job.new
    else
      render file: '/public/404', status: 404
    end
  end

end
