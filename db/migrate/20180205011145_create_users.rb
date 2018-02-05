class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :token
      t.string :token_secret
      t.string :email
      t.string :name
      t.string :expires
      t.string :authorization_expires

      t.timestamps
    end
  end
end
