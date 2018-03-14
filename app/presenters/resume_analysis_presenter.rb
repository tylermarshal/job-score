class ResumeAnalysisPresenter

  attr_reader :current_user, :job_id, :resume_id

  def initialize(current_user, job_id, resume_id)
    @current_user = current_user
    @job_id = job_id
    @resume_id = resume_id
  end

  def user_jobs
    current_user.jobs
  end

  def user_resumes
    current_user.resumes
  end

  def job
    if job_id == nil
      user_jobs.first
    else
      current_user.jobs.find(job_id)
    end
  end

  def resume
    if resume_id == nil
      user_resumes.first
    else
      current_user.resumes.find(resume_id)
    end
  end

  def keywords
    EntityComparisonService.compare(job, resume)
  end

end
