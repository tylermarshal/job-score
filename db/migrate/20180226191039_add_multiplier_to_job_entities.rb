class AddMultiplierToJobEntities < ActiveRecord::Migration[5.1]
  def change
    add_column :job_entities, :multiplier, :decimal
  end
end
