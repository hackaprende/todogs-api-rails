class CreateDogsUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :dog
    end
  end
end
