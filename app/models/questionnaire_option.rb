class QuestionnaireOption < ApplicationRecord
  belongs_to :questionnaire
  has_many :questionnaire_answers, dependent: :destroy
end
