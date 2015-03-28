class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string   "description"
      t.boolean  "complete",     default: false
      t.references "team", index: true
      t.datetime "completed_at"
      t.timestamps null: false
    end
  end
end
