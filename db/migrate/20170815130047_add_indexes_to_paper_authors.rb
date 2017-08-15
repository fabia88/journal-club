class AddIndexesToPaperAuthors < ActiveRecord::Migration[5.0]
  def change
    add_index :paper_authors, :author_id
    add_index :paper_authors, :paper_id
  end
end
