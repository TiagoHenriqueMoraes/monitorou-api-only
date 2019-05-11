class QuestionnaireAnswer < ApplicationRecord
  belongs_to :questionnaire
  belongs_to :questioannaire_option
  belongs_to :user
end
