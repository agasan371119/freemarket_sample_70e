class AddCategoryIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :category_id, :integer, null:false, foreign_key:true
    add_column :items, :buyer_id, :integer, foreign_key:true
    add_column :items, :postage_id, :integer, null:false
    add_column :items, :prefecture_id, :integer, null:false
    add_column :items, :day_id, :integer, null:false
  end
end