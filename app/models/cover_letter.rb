class CoverLetter < ApplicationRecord
  belongs_to :user
  has_many :cover_letter_document_tones, dependent: :destroy
  has_many :cover_letter_sentence_tones, dependent: :destroy
end
