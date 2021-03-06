class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  belongs_to :institution
  belongs_to :course

  has_and_belongs_to_many :study_groups
  has_and_belongs_to_many :subjects

  enum kind: %i[student monitor admin teacher]

  mount_base64_uploader :profile_picture, ProfilePictureUploader

  has_many :worktimes, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :questionnaire_answers

  scope :institution, ->(institution) { where(institution_id: institution) }
  # default_scope -> { includes(:institution, :worktimes, :attendances, course: [:subjects], study_groups: [:subjects]) }

  validates :email, presence: true
  validates :worktimes, presence: true, if: :monitor?

  accepts_nested_attributes_for :worktimes, allow_destroy: true
  # accepts_nested_attributes_for :user_subjects, allow_destroy: true
end
