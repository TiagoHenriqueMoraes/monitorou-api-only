class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :user, foreign_key: true
      t.integer :kind
      t.date :date

      t.timestamps
    end
  end
end
