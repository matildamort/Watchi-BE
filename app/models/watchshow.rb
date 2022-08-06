class Watchshow < ApplicationRecord
has_many :shows, dependent: :destroy
belongs_to :watchlist, optional: true, dependent: :destroy

end
