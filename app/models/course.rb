class Course < ApplicationRecord
  belongs_to :institution
  has_many :subjects
  has_many :users

  scope :institution, -> institution { where(institution_id: institution) }
  scope :subjects, -> { course.subjects }
end
