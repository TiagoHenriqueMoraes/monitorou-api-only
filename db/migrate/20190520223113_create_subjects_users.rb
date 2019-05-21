class CreateSubjectsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :subjects
  end
end
