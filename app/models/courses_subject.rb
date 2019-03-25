class CoursesSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
end
