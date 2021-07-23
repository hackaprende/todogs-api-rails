class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :type
      t.string :height_female
      t.string :height_male
      t.string :image_url
      t.integer :index
      t.string :life_expectancy
      t.string :name_en
      t.string :name_es
      t.string :temperament
      t.string :temperament_en
      t.string :weight_female
      t.string :weight_male
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
