class RenameSalesDateColumnToGames < ActiveRecord::Migration[6.1]
  def change
    rename_column :games, :sales_date, :salesDate
  end
end
