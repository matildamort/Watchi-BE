class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :watchshows, dependent: :destroy
end
