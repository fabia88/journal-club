class AddResearchInterestsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :research_interests, :string
  end
end
