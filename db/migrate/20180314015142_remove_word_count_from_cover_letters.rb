class RemoveWordCountFromCoverLetters < ActiveRecord::Migration[5.1]
  def change
    remove_column :cover_letters, :word_count
  end
end
