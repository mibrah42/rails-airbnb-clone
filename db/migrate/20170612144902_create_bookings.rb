class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :guests
      t.string :status
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
