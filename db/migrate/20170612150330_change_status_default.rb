class ChangeStatusDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :status, :string, null: "pending", default: "pending"
  end
end
