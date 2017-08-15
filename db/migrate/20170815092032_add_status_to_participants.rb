class AddStatusToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :status, :string
  end
end
