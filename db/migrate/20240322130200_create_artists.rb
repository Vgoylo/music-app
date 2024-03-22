class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :email,                     null: false, default: ""
      t.string :first_name,                null: false, default: ""
      t.string :last_name,                 null: false, default: ""
      t.string :nickname,                  null: false, default: ""
      
      t.timestamps
    end
  end
end
