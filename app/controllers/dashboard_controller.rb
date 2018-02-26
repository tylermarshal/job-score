class DashboardController < ApplicationController

  def index
    if params[:notice]
      flash.notice = "You must add at least one resume and one job to complete a resume analysis."
    end
    if logged_in?
      @resume = Resume.new
      @cover_letter = CoverLetter.new
      @job = Job.new
    else
      render file: '/public/404', status: 404
    end
  end

end
