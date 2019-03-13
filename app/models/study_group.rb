class StudyGroup < ApplicationRecord
  belongs_to :institution
  belongs_to :subject

  has_many :users, dependent: :nullify
end
