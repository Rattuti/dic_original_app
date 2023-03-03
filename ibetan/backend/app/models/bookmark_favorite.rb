class BookmarkFavorite < ApplicationRecord
  belongs_to :bookmark
  belongs_to :favorite
end
