class RemoveForeignKeysFromModels < ActiveRecord::Migration
  def change
    remove_column :items, :owner_id, :integer
    remove_column :bookings, :customer_id, :integer
    remove_column :bookings, :item_id, :integer
  end
end
