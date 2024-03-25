class ChangeCreatedDateToBeDateInDownloads < ActiveRecord::Migration[7.1]
  def change
    change_column :downloads, :created_date, :date
  end
end
