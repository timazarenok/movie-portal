class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :full_name, null: false
      t.string :biography
      t.string :date_of_birth, null: false
      t.string :image
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
