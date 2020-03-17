class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.integer :price, null:false
      t.text :description, null:false
      t.string :brand
      t.text :size
      t.string :status, null:false
      t.timestamps
    end
    add_index :items, :name
  end
end
