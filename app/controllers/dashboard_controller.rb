class DashboardController < ApplicationController

  def index
    @resume = Resume.new
    @cover_letter = CoverLetter.new
  end

end
