class ChangeTypeInUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :education, :string
    add_column :users, :education, :text
    remove_column :users, :job_description, :string
    add_column :users, :job_description, :text
    remove_column :users, :research_interests, :string
    add_column :users, :research_interests, :text
  end
end
