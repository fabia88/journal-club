class AddSourceUrlToPapers < ActiveRecord::Migration[5.0]
  def change
    add_column :papers, :source_url, :string
  end
end
