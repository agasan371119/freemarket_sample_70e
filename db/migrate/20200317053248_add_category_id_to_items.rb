class AddCategoryIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :category_id, :integer, null:false, foreign_key:true
    add_column :items, :buyer_id, :integer, foreign_key:true
    add_column :items, :postage, :string, null:false
    add_column :items, :prefecture, :string, null:false
    add_column :items, :day, :integer, null:false 
  end
end
