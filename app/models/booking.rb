class Booking < ActiveRecord::Base
  belongs_to :item
  belongs_to :customer, class_name: "User"

  validates :item, presence: true
  validates :customer, presence: true

end
