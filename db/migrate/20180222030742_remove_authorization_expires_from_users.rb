class RemoveAuthorizationExpiresFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :authorization_expires
  end
end
