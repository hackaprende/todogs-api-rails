class AddMlIdToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :ml_id, :string, :default => ""
  end
end
