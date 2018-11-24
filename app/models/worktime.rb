class Worktime < ApplicationRecord
  belongs_to :user

  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
end
