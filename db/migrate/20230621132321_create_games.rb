class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games, id: false do |t|
       t.string :title, null: false
       t.string :label
       t.string :hardware
       t.string :salesDate
       t.bigint :isbn, null: false, primary_key: true
       t.string :mediumImageUrl
       t.string :largeImageUrl


       t.timestamps
    end
  end
end
