class Show < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :watchlist, dependent: :destroy
    has_one_attached :picture

    def picture_url
        Rails.application.routes.url_helpers.url_for(picture) if picture.attached?
    end
end
