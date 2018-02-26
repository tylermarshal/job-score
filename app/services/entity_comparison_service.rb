class EntityComparisonService

  def self.compare(job_entities, document_entities)
    # job_entities.order("magnitude DESC, salience DESC")
    # document_entities.order("magnitude DESC, salience DESC")
    job = job_entities.sort_by do |entity|
      entity.magnitude * entity.salience
    end.reverse
    document = document_entities.sort_by do |entity|
      entity.magnitude * entity.salience
    end.reverse
    job.reject {|x| document.include? x.entity}
  end

end
