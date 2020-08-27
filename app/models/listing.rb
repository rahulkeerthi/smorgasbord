class Listing < ApplicationRecord
  has_many :bookings
  belongs_to :user
  enum home_type: %i[shared_room entire_place private_room]
end
