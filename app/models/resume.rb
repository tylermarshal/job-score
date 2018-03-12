class Resume < ApplicationRecord
  belongs_to :user

  before_save :calculate_word_count

  def calculate_word_count
    self.word_count = body.split(" ").count
  end
end
