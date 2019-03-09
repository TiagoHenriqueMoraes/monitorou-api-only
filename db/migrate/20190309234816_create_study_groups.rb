class CreateStudyGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :study_groups do |t|
      t.references :institution, foreign_key: true
      t.string :name
      t.references :subject, foreign_key: true
      t.string :theme

      t.timestamps
    end
  end
end
