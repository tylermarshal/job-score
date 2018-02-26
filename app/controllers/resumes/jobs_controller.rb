class Resumes::JobsController < ApplicationController

  def show
    @job_entities = current_user.jobs.find(params[:id]).job_entities
    @resume_entities = current_user.resumes.find(params[:resume]).resume_entities
    @keywords = EntityComparisonService.compare(@job_entities, @resume_entities)
  end

end
