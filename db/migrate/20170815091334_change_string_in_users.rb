class ChangeStringInUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :search_keywords, :string
    add_column :users, :search_keywords, :text, array: true
  end
end
