class RemoveColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :status, :string, null: false, default: "pending"
  end
end
