class CreateDownloads < ActiveRecord::Migration[7.1]
  def change
    create_table :downloads do |t|
      t.belongs_to :song, null:false, foreign_key: true

      t.timestamps
    end
  end
end
