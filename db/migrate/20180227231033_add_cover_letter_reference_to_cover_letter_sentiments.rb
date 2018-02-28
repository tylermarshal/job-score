class AddCoverLetterReferenceToCoverLetterSentiments < ActiveRecord::Migration[5.1]
  def change
    add_reference :cover_letter_sentiments, :cover_letter, foreign_key: true
  end
end
