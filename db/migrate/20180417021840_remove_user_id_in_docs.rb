class RemoveUserIdInDocs < ActiveRecord::Migration[5.1]
  def change
    remove_column :docs, :user_id, :integer
  end
end
