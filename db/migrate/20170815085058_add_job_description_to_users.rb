class AddJobDescriptionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :job_description, :string
  end
end
