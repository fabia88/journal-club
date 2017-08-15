class RemovePaperIdFromColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :authors, :paper_id, :integer
  end
end
