class StudyGroupsContent < ApplicationRecord
  belongs_to :content
  belongs_to :study_group
end
