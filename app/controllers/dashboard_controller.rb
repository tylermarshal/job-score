class DashboardController < ApplicationController

  def index
    if logged_in?
      @resume = Resume.new
      @cover_letter = CoverLetter.new
      @job = Job.new
    else
      render file: '/public/404', status: 404
    end
  end

end
