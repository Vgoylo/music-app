class RenameCreatedAtToCreatedDateInDownloads < ActiveRecord::Migration[7.1]
  def change
    rename_column :downloads, :created_at, :created_date
  end
end
