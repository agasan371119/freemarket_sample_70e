class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user,          foreign_key: true
      t.string :family_name,       null: false
      t.string :first_name,        null: false
      t.string :family_name_kana,  null: false
      t.string :first_name_kana,   null: false
      t.string :postal_code,       null: false
      t.integer :prefecture,       null: false, default: "0"
      t.string :city,              null: false
      t.string :address_block,     null: false
      t.string :building_name     
      t.integer :room_number     
      t.integer :phone_number,     unique: true
      t.timestamps
    end
  end
end