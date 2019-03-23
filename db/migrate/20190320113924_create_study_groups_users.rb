class CreateStudyGroupsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :study_groups_users do |t|
      t.references :user, foreign_key: true
      t.references :study_group, foreign_key: true

      t.timestamps
    end
  end
end
