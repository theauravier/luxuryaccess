class Item < ActiveRecord::Base


  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  belongs_to :owner, class_name: "User"
  has_many :bookings, dependent: :destroy

  validates :category, presence: true
  validates :title, presence: true
  validates :owner, presence: :true
  validates :daily_price, presence: :true
  validates :brand, presence: :true
  validates :city, presence: :true

end
