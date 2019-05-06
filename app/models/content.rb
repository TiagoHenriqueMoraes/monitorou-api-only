class Content < ApplicationRecord
  belongs_to :study_group

  enum kind: %i[photo document]

  mount_base64_uploader :image, 
  mount_base64_uploader :document,
end
