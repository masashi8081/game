class RenameLargeimageUrlColumnToGames < ActiveRecord::Migration[6.1]
  def change
    rename_column :games, :largeimage_url, :largeImageUrl
  end
end
