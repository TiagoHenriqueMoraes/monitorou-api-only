class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.references :institution, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :kind

      t.timestamps
    end
  end
end
