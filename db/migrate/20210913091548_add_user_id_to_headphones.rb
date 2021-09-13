class AddUserIdToHeadphones < ActiveRecord::Migration[6.1]
  def change
    add_column :headphones, :user_id, :integer
  end
end
