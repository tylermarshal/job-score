class Job < ApplicationRecord
  belongs_to :user
  has_many :job_entities, dependent: :destroy

  def full_title
    "#{company_name}: #{job_title}"
  end
end
