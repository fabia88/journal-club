class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    create_table :papers do |t|
      t.date :date
      t.string :title
      t.text :abstract
      t.string :source
      t.string :reference

      t.timestamps
    end
  end
end
