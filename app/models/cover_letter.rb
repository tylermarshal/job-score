class CoverLetter < ApplicationRecord
  belongs_to :user
  has_many :cover_letter_entities, dependent: :destroy

  before_save :calculate_word_count

  def calculate_word_count
    self.word_count = body.split(" ").count
  end
end
