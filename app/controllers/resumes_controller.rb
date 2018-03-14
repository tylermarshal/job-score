class ResumesController < ApplicationController

  def create
    @resume = current_user.resumes.new(resume_params)
    if @resume.save!
      redirect_to dashboard_index_path
    else
      flash.notice = "Something went wrong, try adding your resume again."
      redirect_to dashboard_index_path
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy

    redirect_to dashboard_index_path
  end

  private

    def resume_params
      if params[:image]
        params[:body] = GoogleVisionService.analyze(params[:image]).text
      elsif params[:resume][:body]
        params[:body] = params[:resume][:body].squish
        params[:name] = params[:resume][:name]
      end
      params.permit(:name, :body)
    end

end
