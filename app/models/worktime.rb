class Worktime < ApplicationRecord
  belongs_to :user

  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  scope :user, -> user { where(user_id: user) }
  default_scope -> { includes(user: [:institution, :attendances, course: [:subjects], study_groups: [:subjects]]) }

end
