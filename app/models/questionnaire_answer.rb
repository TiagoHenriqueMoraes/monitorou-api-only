class QuestionnaireAnswer < ApplicationRecord
  belongs_to :questionnaire
  belongs_to :questionnaire_option
  belongs_to :user

  # scope :answered_by_user, -> (user, questionnaire) { where(user_id: user.id, questionnaire_id: questionnaire.id) }
  scope :student, -> (user_id) { where(user_id: user_id) }
  scope :correct_answers, -> (quiz_id) { joins(:questionnaire_option).where(questionnaire_options: { correct: true }, questionnaire_id: quiz_id )}
  scope :questionnaire, -> (quiz_id) { where(questionnaire_id: quiz_id) }
end
