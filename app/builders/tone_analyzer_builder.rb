class ToneAnalyzerBuilder

  attr_reader :response, :cover_letter

  def initialize(cover_letter)
    @cover_letter = cover_letter
    @response = WatsonService.new(cover_letter.body).parse
  end

  def generate
    puts "got to builder"
    generate_document_tone
    generate_sentence_tone
  end

  def generate_document_tone
    unless !response[:document_tone]
      response[:document_tone][:tones].each do |tone|
        cover_letter.cover_letter_document_tones.create!(
          tone: tone[:tone_name],
          score: tone[:score]
        )
      end
    end
  end

  def generate_sentence_tone
    unless !response[:sentences_tone]
      response[:sentences_tone].each do |sentence|
        sentence[:tones].each do |tone|
          cover_letter.cover_letter_sentence_tones.create!(
            sentence: sentence[:text],
            tone: tone[:tone_name],
            score: tone[:score]
          )
        end
      end
    end
  end

end
