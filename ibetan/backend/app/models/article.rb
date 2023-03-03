class Article < ApplicationRecord
    belongs_to :user, optional: true

    has_many :bookmarks, dependent: :destroy
    has_many :favorites, dependent: :destroy
end