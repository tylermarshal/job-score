class CoverLetterAnalysisPresenter

  attr_reader :current_user, :job_id, :cover_letter_id

  def initialize(current_user, job_id, cover_letter_id)
    @current_user = current_user
    @job_id = job_id
    @cover_letter_id = cover_letter_id
  end

  def user_jobs
    current_user.jobs
  end

  def user_cover_letters
    current_user.cover_letters
  end

  def job
    if job_id == nil
      user_jobs.first
    else
      current_user.jobs.find(job_id)
    end
  end

  def cover_letter
    if cover_letter_id == nil
      user_cover_letters.first
    else
      current_user.cover_letters.find(cover_letter_id)
    end
  end

  def keywords
    EntityComparisonService.compare(job, cover_letter)
  end

end
