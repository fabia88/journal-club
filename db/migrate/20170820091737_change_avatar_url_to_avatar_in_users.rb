class ChangeAvatarUrlToAvatarInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :avatar_url, :avatar
  end
end
