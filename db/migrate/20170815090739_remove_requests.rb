class RemoveRequests < ActiveRecord::Migration[5.0]
  def up
    drop_table :requests
  end

  def down
    create_table "requests", force: :cascade do |t|
      t.string   "status"
      t.integer  "user_id"
      t.integer  "lab_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["lab_id"], name: "index_requests_on_lab_id", using: :btree
      t.index ["user_id"], name: "index_requests_on_user_id", using: :btree
    end
  end
end
