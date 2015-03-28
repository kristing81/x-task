class CreateMutants < ActiveRecord::Migration
  def change
    create_table :mutants do |t|
      t.string   "name"
      t.references "team", index: true
      t.timestamps null: false
    end
  end
end
