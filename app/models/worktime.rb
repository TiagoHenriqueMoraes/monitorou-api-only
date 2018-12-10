class Worktime < ApplicationRecord
  belongs_to :user

  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  scope :user, -> user { where(user_id: user) }

end
