class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :article

    has_many :bookmark
end
