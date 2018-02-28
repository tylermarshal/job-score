class CreateCoverLetterSentiments < ActiveRecord::Migration[5.1]
  def change
    create_table :cover_letter_sentiments do |t|
      t.text :sentence
      t.decimal :magnitude
      t.decimal :score

      t.timestamps
    end
  end
end
