class AddIndexToDownloads < ActiveRecord::Migration[7.1]
  def change
    add_index :downloads, :created_date
  end
end
