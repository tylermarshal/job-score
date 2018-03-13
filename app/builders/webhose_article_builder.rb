class WebhoseArticleBuilder

  def self.generate(job)
    news = WebhoseService.new(job.company_name).parse
    news[:posts].each do |article|
      job.webhose_articles.create!(
        url: article[:thread][:url],
        site: article[:thread][:site],
        title: article[:thread][:title]
      )
    end
  end

end
