class ResumeEntityService

  def generate(resume)
    entities = GoogleNaturalLanguageService.analyze(resume.body)
    entities.each do |entity|
      if entity.salience != 0.0 && entity.sentiment.magnitude != 0.0
          resume.resume_entities.create!(
            entity: entity.name,
            salience: entity.salience,
            magnitude: entity.sentiment.magnitude
          )
      end
    end
  end

end
