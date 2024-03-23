class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title,                    null: false, default: "Untitled"
      t.belongs_to :artist, null:false,   foreign_key: true
      t.integer :length,                  null: false
      t.integer :filesize,                null: false

      t.timestamps
    end
  end
end
