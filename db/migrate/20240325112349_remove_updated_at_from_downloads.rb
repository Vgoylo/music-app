class RemoveUpdatedAtFromDownloads < ActiveRecord::Migration[7.1]
  def change
    remove_column :downloads, :updated_at, :datetime
  end
end
