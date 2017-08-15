class AddColumnToLabs < ActiveRecord::Migration[5.0]
  def change
    add_column :labs, :creator_id, :integer
  end
end
