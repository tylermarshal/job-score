class CreateJobEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :job_entities do |t|
      t.references :job, foreign_key: true
      t.string :entity
      t.integer :salience
      t.integer :magnitude
      t.string :wikipedia

      t.timestamps
    end
  end
end
