class Bookmark < ApplicationRecord
    belongs_to :user
    belongs_to :article

    has_many :favorite
end
