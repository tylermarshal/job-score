class CreateCoverLetters < ActiveRecord::Migration[5.1]
  def change
    create_table :cover_letters do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
