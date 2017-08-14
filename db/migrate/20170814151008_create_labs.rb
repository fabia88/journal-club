class CreateLabs < ActiveRecord::Migration[5.0]
  def change
    create_table :labs do |t|
      t.string :name
      t.text :description
      t.string :photo_url
      t.boolean :archived

      t.timestamps
    end
  end
end
