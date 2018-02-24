class RemoveWikipediaFromResumeEntities < ActiveRecord::Migration[5.1]
  def change
    remove_column :resume_entities, :wikipedia
  end
end
