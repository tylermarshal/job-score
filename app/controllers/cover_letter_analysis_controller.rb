class CoverLetterAnalysisController < ApplicationController

  def show
    @cover_letter_analysis = CoverLetterAnalysisPresenter.new(current_user, params[:id], params[:cover_letter])
  end

end
