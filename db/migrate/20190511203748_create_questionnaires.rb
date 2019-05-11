class CreateQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.references :subject, foreign_key: true
      t.string :description
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
