class AddColumnToPaperAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :paper_authors, :paper_id, :integer
    add_column :paper_authors, :author_id, :integer
  end
end
