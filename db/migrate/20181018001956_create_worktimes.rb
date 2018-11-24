class CreateWorktimes < ActiveRecord::Migration[5.2]
  def change
    create_table :worktimes do |t|
      t.time :start_time
      t.time :end_time
      t.integer :day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
