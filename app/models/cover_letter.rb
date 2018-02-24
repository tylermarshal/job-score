class CoverLetter < ApplicationRecord
  belongs_to :user
  has_many :cover_letter_entities
end
