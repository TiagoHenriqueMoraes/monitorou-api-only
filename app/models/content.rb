class Content < ApplicationRecord
  belongs_to :study_group

  enum kind: %i[photo document]

  
end
