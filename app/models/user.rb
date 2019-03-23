class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  belongs_to :institution
  belongs_to :course

  has_and_belongs_to_many :study_group, optional: true

  enum kind: %i[student monitor admin]

  mount_uploader :profile_picture, ProfilePictureUploader

  has_many :worktimes, dependent: :destroy

  scope :institution, ->(institution) { where(institution_id: institution) }

  validates :email, presence: true
  validates :worktimes, presence: true, if: :monitor?

  accepts_nested_attributes_for :worktimes, allow_destroy: true
end
