class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :age, null: false
      t.string :address, null: false
      t.string :remark, null: false

      t.timestamps
    end
  end
end
