class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.references :game, null: false, foreign_key: true
      t.references :customer, null: false
      t.float :rate
      t.text :comment

      t.timestamps
    end

  end
end
