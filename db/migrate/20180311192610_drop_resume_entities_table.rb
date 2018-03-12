class DropResumeEntitiesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :resume_entities
  end
end
