class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.references :study_group, foreign_key: true
      t.string :document
      t.string :image
      t.integer :kind

      t.timestamps
    end
  end
end
