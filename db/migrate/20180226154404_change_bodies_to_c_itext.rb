class ChangeBodiesToCItext < ActiveRecord::Migration[5.1]
  def change
    enable_extension("citext")
    change_column :cover_letters, :body, :citext
    change_column :resumes, :body, :citext
    change_column :jobs, :description, :citext
  end
end
