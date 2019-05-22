class SubjectsUsers < ApplicationRecord
  belongs_to :user
  belongs_to :subject
end
