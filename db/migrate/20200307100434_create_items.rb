class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.integer :price, null:false
      t.text :description, null:false
      t.string :brand
      t.text :size
      t.string :status, null:false
      # t.references :category, null:false,foreign_key:true
      # t.references :user, null:false, foreign_key:true     
      t.timestamps
    end
    add_index :items, :name
    # add_index :items, :category_id
  end
end
