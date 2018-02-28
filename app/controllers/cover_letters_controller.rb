class CoverLettersController < ApplicationController

  def create
    @cover_letter = current_user.cover_letters.new(cover_letter_params)
    if @cover_letter.save!
      CoverLetterEntityService.generate(@cover_letter)
      CoverLetterSentimentService.generate(@cover_letter)
      ToneAnalyzerService.new(@cover_letter).generate
      redirect_to dashboard_index_path
    else
      flash.notice = "Something went wrong, try adding your cover letter again."
      redirect_to dashboard_index_path
    end
  end

  private

    def cover_letter_params
      if params[:image]
        params[:body] = GoogleVisionService.analyze(params[:image]).text
      elsif params[:cover_letter][:body]
        params[:body] = params[:cover_letter][:body].gsub!(/([^\r\n])\r\n([^\r\n])/, '\1 \2')
        params[:name] = params[:cover_letter][:name]
      end
      params.permit(:name, :body)
    end

end
