class Room < ApplicationRecord
  belongs_to :user

  def self.update_or_create_by(args, attributes)
    obj = find_or_create_by(args)
    obj.update(attributes)
    obj
  end
end
