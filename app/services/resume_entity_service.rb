class ResumeEntityService

  def generate(resume)
    entities = GoogleNaturalLanguageService.new.analyze(resume.body)
    entities.each do |entity|
      if entity.salience != 0.0 && entity.sentiment.magnitude != 0.0
        if entity.metadata.has_key?("wikipedia_url")
          resume.resume_entities.create!(
            entity: entity.name,
            salience: entity.salience,
            magnitude: entity.sentiment.magnitude,
            wikipedia: entity.metadata["wikipedia_url"]
          )
        else
          resume.resume_entities.create!(
            entity: entity.name,
            salience: entity.salience,
            magnitude: entity.sentiment.magnitude,
            wikipedia: nil
          )
        end
      end
    end
  end

end
