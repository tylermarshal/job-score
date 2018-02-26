class EntityComparisonService

  def self.compare(job, document)
    ordered_job_entities = job.job_entities.order(multiplier: :desc)
    ordered_job_entities.reject do |word|
      job.company_name == word.entity || document.body.include?(word.entity)
    end
  end

  

end
