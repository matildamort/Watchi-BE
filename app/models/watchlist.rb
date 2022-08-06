class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :watchshows, optional: true, dependent: :destroy
end
