class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.decimal :minTemperature
      t.decimal :maxTemperature
      t.string :season

      t.timestamps null: false
    end
  end
end
