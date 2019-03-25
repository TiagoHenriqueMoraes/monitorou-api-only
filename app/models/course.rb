class Course < ApplicationRecord
  belongs_to :institution
  
  has_many :users
  
  has_and_belongs_to_many :subjects
  
  scope :institution, -> institution { where(institution_id: institution) }
  scope :subjects, -> { course.subjects }
end
