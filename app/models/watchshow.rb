class Watchshow < ApplicationRecord
    belongs_to :watchlists #dependent: :destroy
    belongs_to :show #dependent: :destroy
# belongs_to :watchlist, optional: :true, dependent: :destroy
end
