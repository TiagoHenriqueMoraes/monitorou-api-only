class Worktime < ApplicationRecord
  belongs_to :user

  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  scope :user, -> user { where(user_id: user) }

  def as_json(options={})
    {       
      id: self.id,
      user_id: self.user_id,
      day: self.day,
      end_time: self.end_time.strftime("%H:%M:%S"),
      start_time: self.start_time.strftime("%H:%M:%S")
    }
  end
end
