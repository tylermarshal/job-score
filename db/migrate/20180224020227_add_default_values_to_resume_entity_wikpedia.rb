class AddDefaultValuesToResumeEntityWikpedia < ActiveRecord::Migration[5.1]
  def change
    change_column :resume_entities, :wikipedia, :string, default: nil
  end
end
