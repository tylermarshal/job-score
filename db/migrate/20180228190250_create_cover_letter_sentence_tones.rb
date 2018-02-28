class CreateCoverLetterSentenceTones < ActiveRecord::Migration[5.1]
  def change
    create_table :cover_letter_sentence_tones do |t|
      t.references :cover_letter, foreign_key: true
      t.text :sentence
      t.decimal :score
      t.string :tone

      t.timestamps
    end
  end
end
