class RenameUserIdInBookings < ActiveRecord::Migration
  def change
    rename_column :bookings, :user_id, :customer_id
  end
end
