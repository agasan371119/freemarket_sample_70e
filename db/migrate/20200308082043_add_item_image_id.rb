class AddItemImageId < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_image_id, :integer, null:false,foreign_key:true
  end
end
