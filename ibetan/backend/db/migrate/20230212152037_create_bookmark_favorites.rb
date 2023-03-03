class CreateBookmarkFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmark_favorites do |t|
      t.references :bookmark, null: false, foreign_key: true
      t.references :favorite, null: false, foreign_key: true

      t.timestamps
    end
  end
end
