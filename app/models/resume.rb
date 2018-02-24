class Resume < ApplicationRecord
  belongs_to :user
  has_many :resume_entities
end
