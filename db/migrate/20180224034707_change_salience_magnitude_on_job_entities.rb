class ChangeSalienceMagnitudeOnJobEntities < ActiveRecord::Migration[5.1]
  def change
    change_column :job_entities, :salience, :decimal
    change_column :job_entities, :magnitude, :decimal
  end
end
