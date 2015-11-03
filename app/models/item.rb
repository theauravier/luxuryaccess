class Item < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :bookings, dependent: :destroy

  validates :category, presence: true
  validates :title, presence: true
  validates :owner, presence: :true
end
