class ChangeEntitiesToCItext < ActiveRecord::Migration[5.1]
  def change
    enable_extension("citext")
    change_column :cover_letter_entities, :entity, :citext
    change_column :resume_entities, :entity, :citext
    change_column :job_entities, :entity, :citext
  end
end
