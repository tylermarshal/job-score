class CoverLetterEntityService

  def self.generate(cover_letter)
    entities = GoogleNaturalLanguageService.analyze(cover_letter.body)
    entities.each do |entity|
      if entity.salience != 0.0 && entity.sentiment.magnitude != 0.0 && entity.sentiment.score != 0.0
          cover_letter.cover_letter_entities.create!(
            entity: entity.name,
            salience: entity.salience,
            magnitude: entity.sentiment.magnitude,
            score: entity.sentiment.score
          )
      end
    end
  end

end
