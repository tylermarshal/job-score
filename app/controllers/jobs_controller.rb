class JobsController < ApplicationController

  def create
    @job = current_user.jobs.new(job_params)
    if @job.save!
      JobEntityBuilder.generate(@job)
      WebhoseArticleBuilder.generate(@job)
      redirect_to dashboard_index_path
    else
      flash.notice = "Something went wrong, try adding the job description again."
      redirect_to dashboard_index_path
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to dashboard_index_path
  end

  private

    def job_params
      if params[:image]
        params[:description] = GoogleVisionService.analyze(params[:image]).text
      elsif params[:job][:description]
        params[:description] = params[:job][:description].gsub!(/([^\r\n])\r\n([^\r\n])/, '\1 \2')
        params[:company_name] = params[:job][:company_name]
        params[:job_title] = params[:job][:job_title]
      end
      params.permit(:company_name, :job_title, :description)
    end

end
