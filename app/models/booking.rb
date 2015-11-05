class Booking < ActiveRecord::Base
  belongs_to :item
  belongs_to :customer, class_name: "User"

  validates :item, presence: true
  validates :customer, presence: true
  validates :start_day, presence: true
  validates :end_day, presence: true

  def owner
    item.owner
  end

end
