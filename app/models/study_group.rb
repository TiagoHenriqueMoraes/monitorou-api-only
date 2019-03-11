class StudyGroup < ApplicationRecord
  belongs_to :institution
  belongs_to :subject
end
