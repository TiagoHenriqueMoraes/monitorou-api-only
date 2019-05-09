class Content < ApplicationRecord
  belongs_to :study_group

  enum kind: %i[image document]

  mount_base64_uploader :image, StudyGroupsImageUploader
  mount_base64_uploader :document, StudyGroupsDocumentUploader
end
