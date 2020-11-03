class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.string :name
      t.string :description, limit: 500
      t.string :image
      t.time :duration
      t.integer :number
      t.references :serial, null: false, foreign_key: true

      t.timestamps
    end
  end
end
