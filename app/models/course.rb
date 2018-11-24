class Course < ApplicationRecord
  belongs_to :institution
  has_many :subjects

  scope :institution, -> institution { where(institution_id: institution) }
end
