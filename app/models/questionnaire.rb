class Questionnaire < ApplicationRecord
  belongs_to :subject
  belongs_to :institution

  has_many :questionnaire_options, inverse_of: :questionnaire, dependent: :destroy
  has_many :questionnaire_answers, inverse_of: :questionnaire, dependent: :destroy
  has_many :users, through: :questionnaire_answers

  accepts_nested_attributes_for :questionnaire_options, reject_if: :all_blank, allow_destroy: true
end
