class AddDefaultValueToResumeEntityWikpedia < ActiveRecord::Migration[5.1]
  def change
    change_column_default :resume_entities, :wikipedia, nil
  end
end
