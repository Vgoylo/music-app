class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title,             null: false, default: "Untitled"
      t.text :description,         null: false, default: ""
      t.bigint :artist_id,         null: false

      t.timestamps
    end
  end
end
