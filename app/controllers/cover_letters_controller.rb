class CoverLettersController < ApplicationController

  def create
    @cover_letter = current_user.cover_letters.new(cover_letter_params)
    if @cover_letter.save!
      CoverLetterEntityService.new.generate(@cover_letter)
      redirect_to dashboard_index_path
    else
      flash.notice = "Something went wrong, try adding your cover letter again."
      redirect_to dashboard_index_path
    end
  end

  private

    def cover_letter_params
      params.require(:cover_letter).permit(:name, :body)
    end

end
