class CoverLetter < ApplicationRecord
  belongs_to :user
  has_many :cover_letter_entities, dependent: :destroy
  has_many :cover_letter_sentiments, dependent: :destroy
  has_many :cover_letter_document_tones, dependent: :destroy
  has_many :cover_letter_sentence_tones, dependent: :destroy

  before_save :calculate_word_count

  def calculate_word_count
    self.word_count = body.split(" ").count
  end

  

end
