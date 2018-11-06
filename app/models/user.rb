class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  belongs_to :institution
  belongs_to :course

  enum kind: [:student, :monitor, :admin]

  has_many :worktimes, dependent: :destroy

  validates :email, presence: :true

  accepts_nested_attributes_for :worktimes, allow_destroy: true
end
