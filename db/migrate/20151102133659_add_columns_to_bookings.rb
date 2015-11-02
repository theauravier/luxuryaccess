class AddColumnsToBookings < ActiveRecord::Migration
  def change
    add_column(:bookings, :start_day, :date)
    add_column(:bookings, :end_day, :date)
    add_column(:bookings, :item_id, :integer)
    add_column(:bookings, :customer_id, :integer)
    add_column(:bookings, :price, :float)
    add_column(:bookings, :status, :string)
  end
end
