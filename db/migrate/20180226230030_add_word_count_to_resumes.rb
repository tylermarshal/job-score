class AddWordCountToResumes < ActiveRecord::Migration[5.1]
  def change
    add_column :resumes, :word_count, :integer
    add_column :cover_letters, :word_count, :integer
  end
end
