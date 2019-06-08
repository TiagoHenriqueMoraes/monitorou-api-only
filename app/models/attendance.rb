class Attendance < ApplicationRecord
  belongs_to :user

  enum kind: [:absent, :presence]

  scope :user, -> (user_id) { where(user_id: user_id) }
end
