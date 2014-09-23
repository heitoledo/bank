class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :week, index: true
      t.integer :entry_type
      t.string :description
      t.date :date
      t.decimal :value

      t.timestamps
    end
  end
end
