class Watchlist < ApplicationRecord
  belongs_to :user
  has_one :user
  has_many :show
end
