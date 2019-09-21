class AlterEstatesAddUserIdColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :estates, :user_id, :integer
    add_index :estates, :user_id
  end
end
