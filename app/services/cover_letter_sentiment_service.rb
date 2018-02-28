class CoverLetterSentimentService

  def self.generate(cover_letter)
    sentences = GoogleSentimentService.analyze(cover_letter.body)
    sentences.each do |entity|
      if entity.sentiment.magnitude * entity.sentiment.score <= 0.02 && entity.sentiment.magnitude * entity.sentiment.score != 0.0
        cover_letter.cover_letter_sentiments.create!(
          sentence: entity.text.content,
          magnitude: entity.sentiment.magnitude,
          score: entity.sentiment.score)
      end
    end
  end

end
