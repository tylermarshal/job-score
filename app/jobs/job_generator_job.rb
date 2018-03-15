class JobGeneratorJob < ApplicationJob
  queue_as :default

  def perform(job)
    JobEntityBuilder.generate(job)
    WebhoseArticleBuilder.generate(job)
  end
end
