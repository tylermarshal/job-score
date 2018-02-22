class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.references :user, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
