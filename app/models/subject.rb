class Subject < ApplicationRecord
  belongs_to :course
  has_many :study_groups

  scope :course, -> course { where(course_id: course) }
end
