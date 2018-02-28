class JobsController < ApplicationController

  def create
    @job = current_user.jobs.new(job_params)
    if @job.save!
      JobEntityService.generate(@job)
      redirect_to dashboard_index_path
    else
      flash.notice = "Something went wrong, try adding the job description again."
      redirect_to dashboard_index_path
    end
  end

  private

    def job_params
      if params[:image]
        params[:description] = GoogleVisionService.analyze(params[:image]).text
      end
      params.permit(:company_name, :job_title, :description)
    end

end
