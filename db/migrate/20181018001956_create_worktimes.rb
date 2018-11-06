class CreateWorktimes < ActiveRecord::Migration[5.2]
  def change
    create_table :worktimes do |t|
      t.datetime :worktime
      t.integer :day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
