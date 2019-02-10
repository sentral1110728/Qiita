class RenameTextColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :text, :content
  end
end
