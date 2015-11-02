class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_column(:items, :title, :string)
    add_column(:items, :owner_id, :integer)
    add_column(:items, :daily_price, :float)
    add_column(:items, :description, :string)
    add_column(:items, :category, :string)
    add_column(:items, :brand, :string)
    add_column(:items, :city, :string)
    add_column(:items, :picture_url_1, :string)
    add_column(:items, :picture_url_2, :string)
    add_column(:items, :picture_url_3, :string)
  end
end
