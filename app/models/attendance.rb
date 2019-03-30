class Attendance < ApplicationRecord
  belongs_to :user

  enum kind: [:absent, :presence]
end
