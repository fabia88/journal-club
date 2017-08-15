class RenameLabsIdToParticipants < ActiveRecord::Migration[5.0]
  def change
    rename_column :participants, :labs_id, :lab_id
  end
end
