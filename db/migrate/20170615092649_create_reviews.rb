class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.text :body
      t.integer :stars
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
