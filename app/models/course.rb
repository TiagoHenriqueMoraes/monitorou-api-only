class Course < ApplicationRecord
  belongs_to :institution

  scope :institution, -> institution { where(institution_id: institution) }
end
