class Worktime < ApplicationRecord
  belongs_to :user, optional: true

  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
end
