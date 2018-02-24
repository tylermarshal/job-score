class CreateCoverLetterEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :cover_letter_entities do |t|
      t.references :cover_letter, foreign_key: true
      t.string :entity
      t.integer :salience
      t.integer :magnitude
      t.integer :score

      t.timestamps
    end
  end
end
