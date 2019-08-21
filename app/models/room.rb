class Room < ApplicationRecord
  belongs_to :user

  def name
    "room-#{id}"
  end
end
