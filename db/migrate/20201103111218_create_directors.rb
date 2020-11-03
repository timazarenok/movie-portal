class CreateDirectors < ActiveRecord::Migration[6.0]
  def change
    create_table :directors do |t|
      t.string :full_name
      t.string :biography
      t.date :date_of_birth
      t.string :image
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
