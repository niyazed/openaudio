class CreateHeadphones < ActiveRecord::Migration[6.1]
  def change
    create_table :headphones do |t|
      t.string :model
      t.text :description
      t.string :brand
      t.string :price
      t.string :rent

      t.timestamps
    end
  end
end
