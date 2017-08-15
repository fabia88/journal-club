class RenameUsersIdToParticipants < ActiveRecord::Migration[5.0]
  def change
    rename_column :participants, :users_id, :user_id
  end
end
