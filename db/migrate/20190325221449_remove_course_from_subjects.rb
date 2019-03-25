class RemoveCourseFromSubjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :subjects, :course_id, :bigint
  end
end
