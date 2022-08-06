class Watchshow < ApplicationRecord
    has_many :watchlists, dependent: :destroy
    has_many :shows, dependent: :destroy
# belongs_to :watchlist, optional: :true, dependent: :destroy
end
