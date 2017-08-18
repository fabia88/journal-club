class ChangeDefaultValueOnSearchKeywords < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:users, :search_keywords, [])
  end
end
