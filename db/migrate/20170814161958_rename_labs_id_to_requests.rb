class RenameLabsIdToRequests < ActiveRecord::Migration[5.0]
  def change
    rename_column :requests, :labs_id, :lab_id
  end
end
