class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string :name, null: false
      t.string :line, null: false
      t.string :distance, null: false
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
