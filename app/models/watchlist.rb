class Watchlist < ApplicationRecord
  belongs_to :user
  belongs_to :show
  has_one :user
  has_many :shows
end
