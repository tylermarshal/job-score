class CreateWebhoseArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :webhose_articles do |t|
      t.references :job, foreign_key: true
      t.string :url
      t.string :site
      t.string :title

      t.timestamps
    end
  end
end
