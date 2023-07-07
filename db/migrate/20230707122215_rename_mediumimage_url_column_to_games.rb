class RenameMediumimageUrlColumnToGames < ActiveRecord::Migration[6.1]
  def change
    rename_column :games, :mediumimage_url, :mediumImageUrl
  end
end
