class AddImageToDocs < ActiveRecord::Migration[5.1]
  def change
    add_column :docs, :photo, :string
  end
end
