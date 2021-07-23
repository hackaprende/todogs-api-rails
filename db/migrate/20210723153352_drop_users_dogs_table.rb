class DropUsersDogsTable < ActiveRecord::Migration[6.1]
  def change
    def up
      drop_table :users_dogs
    end
  
    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
