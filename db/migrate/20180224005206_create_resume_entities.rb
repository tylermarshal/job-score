class CreateResumeEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :resume_entities do |t|
      t.references :resume, foreign_key: true
      t.string :entity
      t.decimal :salience
      t.decimal :magnitude
      t.string :wikipedia

      t.timestamps
    end
  end
end
