class AddCreatorIndexToLabs < ActiveRecord::Migration[5.0]
  def change
    add_index :labs, :creator_id
  end
end
