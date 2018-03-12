class DropCoverLetterSentimentsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :cover_letter_sentiments
  end
end
