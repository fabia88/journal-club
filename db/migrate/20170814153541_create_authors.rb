class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :paper, foreign_key: true

      t.timestamps
    end
  end
end
