class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :description
      t.date :date
      t.references :courses_subject, foreign_key: true

      t.timestamps
    end
  end
end
