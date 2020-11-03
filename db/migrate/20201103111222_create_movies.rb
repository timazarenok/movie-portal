class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description, limit: 500
      t.string :clip
      t.date :release_date
      t.time :duration
      t.references :category, null: false, foreign_key: true
      t.references :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
