class DashboardController < ApplicationController

  def index
    @resume = Resume.new
  end

end
