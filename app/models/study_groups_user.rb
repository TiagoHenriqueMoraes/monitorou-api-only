class StudyGroupsUser < ApplicationRecord
  belongs_to :user
  belongs_to :study_group

  validates :user, :study_group, presence: true, on: :create
end
