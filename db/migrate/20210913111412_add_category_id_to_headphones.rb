class AddCategoryIdToHeadphones < ActiveRecord::Migration[6.1]
  def change
    add_column :headphones, :category_id, :integer
  end
end
