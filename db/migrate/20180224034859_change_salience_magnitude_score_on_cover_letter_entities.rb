class ChangeSalienceMagnitudeScoreOnCoverLetterEntities < ActiveRecord::Migration[5.1]
  def change
    change_column :cover_letter_entities, :salience, :decimal
    change_column :cover_letter_entities, :magnitude, :decimal
    change_column :cover_letter_entities, :score, :decimal
  end
end
