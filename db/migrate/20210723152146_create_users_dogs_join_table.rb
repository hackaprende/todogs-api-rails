class CreateUsersDogsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users_dogs, id: false do |t|
      t.belongs_to :user
      t.belongs_to :dog
    end
  end
end
