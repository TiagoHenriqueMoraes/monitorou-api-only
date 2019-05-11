class CreateQuestionnaireAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaire_answers do |t|
      t.references :questionnaire, foreign_key: true
      t.references :questionnaire_option, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
