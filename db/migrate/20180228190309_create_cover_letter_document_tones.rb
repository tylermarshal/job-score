class CreateCoverLetterDocumentTones < ActiveRecord::Migration[5.1]
  def change
    create_table :cover_letter_document_tones do |t|
      t.references :cover_letter, foreign_key: true
      t.decimal :score
      t.string :tone

      t.timestamps
    end
  end
end
