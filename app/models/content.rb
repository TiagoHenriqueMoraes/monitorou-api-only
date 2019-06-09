class Content < ApplicationRecord
  belongs_to :study_group

  enum kind: %i[image document]

  mount_base64_uploader :image, StudyGroupsImageUploader
  mount_base64_uploader :document, StudyGroupsDocumentUploader

  before_save :upload_to_aws

  def upload_to_aws
    @obj = S3_BUCKET.object(document.filename) if document?  
    @obj = S3_BUCKET.object(image.filename) if image?
    if document? ? upload_string(document) : upload_string(image)
      self.file_url = @obj.public_url
    else
      "Erro no upload do arquivo! Tente novamente."
    end
  end

  private

  def upload_string(file)
    @obj.upload_file file.file.file, { acl: 'public-read' }
  end
end

