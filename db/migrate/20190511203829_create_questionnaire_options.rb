class CreateQuestionnaireOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaire_options do |t|
      t.references :questionnaire, foreign_key: true
      t.boolean :correct
      t.string :description

      t.timestamps
    end
  end
end
