class Subject < ApplicationRecord
  belongs_to :course

  scope :course, -> course { where(course_id: course) }
end
