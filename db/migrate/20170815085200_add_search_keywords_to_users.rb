class AddSearchKeywordsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :search_keywords, :string
  end
end
