class JobEntityService

  def self.generate(job)
    entities = GoogleNaturalLanguageService.analyze(job.description)
    entities.each do |entity|
      if entity.salience != 0.0 && entity.sentiment.magnitude != 0.0
        if entity.metadata.has_key?("wikipedia_url")
          job.job_entities.create!(
            entity: entity.name,
            salience: entity.salience,
            magnitude: entity.sentiment.magnitude,
            wikipedia: entity.metadata["wikipedia_url"]
          )
        else
          job.job_entities.create!(
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
