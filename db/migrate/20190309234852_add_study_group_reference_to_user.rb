class AddStudyGroupReferenceToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :study_group, foreign_key: true
  end
end
