class AddItemToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :item, index: true, foreign_key: true
  end
end
