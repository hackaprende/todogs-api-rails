class RemoveDogsUserIdColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :dogs, :user_id, :integer
  end
end
