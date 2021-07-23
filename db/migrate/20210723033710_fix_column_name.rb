class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :dogs, :type, :dog_type
  end
end
