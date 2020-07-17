class AddFileUrlToContent < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :file_url, :string
  end
end
