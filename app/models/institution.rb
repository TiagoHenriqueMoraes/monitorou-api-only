class Institution < ApplicationRecord
  has_many :users
  has_many :courses
  has_many :study_groups
end
