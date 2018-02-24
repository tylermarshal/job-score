class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: true
      t.string :company_name
      t.string :job_title
      t.text :description

      t.timestamps
    end
  end
end
