class Job < ApplicationRecord
  belongs_to :user
  has_many :job_entities, dependent: :destroy
  has_many :webhose_articles, dependent: :destroy

  def full_title
    "#{company_name}: #{job_title}"
  end

  def update_articles
    if webhose_articles.first.created_at + 86400 <= Time.now
      webhose_articles.destroy_all
      WebhoseArticleBuilder.generate(self)
    end
  end
end
