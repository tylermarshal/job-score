class CoverLetterEntityService

  def self.generate(cover_letter)
    sentences = GoogleSentimentService.analyze(cover_letter.body)
    sentences.each do |entity|
      cover_letter.cover_letter_sentiments.create!(
        entity: entity.name,
        salience: entity.salience,
        magnitude: entity.sentiment.magnitude,
        score: entity.sentiment.score)
    end
  end

end
