class CreateSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :series do |t|
      t.string :name
      t.string :description, limit: 500
      t.string :image
      t.time :duration
      t.integer :number
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end
