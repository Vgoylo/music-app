class ChangeCreatDateToBeDateInDownloads < ActiveRecord::Migration[7.1]
  def up
    change_column_null :downloads, :created_date, false
  end

  def down
    change_column :downloads, :created_date, :date
  end
end
