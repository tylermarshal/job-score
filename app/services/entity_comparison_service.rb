class EntityComparisonService

  def self.compare(job, document)
    ordered_job_entities = job.job_entities.order(multiplier: :desc)
    ordered_job_entities.reject do |word|
      job.company_name == word.entity || document.body.include?(word.entity)
    end
  end

  def self.percentage(job, document)
    job.job_entities.reduce(0) do |result, word|
      result += 1 if job.company_name == word.entity || document.body.include?(word.entity)
      result
    end.to_f/job.job_entities.count
  end



end
