class Subject < ApplicationRecord
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :users

  has_many :study_groups, dependent: :nullify

  scope :course, -> course { where(course_id: course) }
end
