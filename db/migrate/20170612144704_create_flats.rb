class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.integer :price
      t.string :title
      t.string :address
      t.string :description
      t.integer :bedrooms
      t.integer :capacity
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
