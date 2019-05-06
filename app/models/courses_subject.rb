class CoursesSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject

  has_many :events
end
