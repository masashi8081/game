class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
       t.string :title, null: false
       t.string :label, null: false
       t.string :hardware, null: false
       t.datetime :salesdate, null: false
       t.bigint :isbn, null: false, primary_key: true


       t.timestamps
    end
  end
end
