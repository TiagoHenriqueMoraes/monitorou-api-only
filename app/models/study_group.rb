class StudyGroup < ApplicationRecord
  belongs_to :institution
  belongs_to :subject

  has_many :contents
  
  has_and_belongs_to_many :users, optional: true

end
