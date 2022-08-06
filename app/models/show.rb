class Show < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_one_attached :picture
    belongs_to :watchshows, dependent: :destroy
    # has_many :watchshows, optional: true, dependent: :destroy
    # has_many :watchlists, through: :watchshows, dependent: :destroy
   
    def picture_url
        Rails.application.routes.url_helpers.url_for(picture) if picture.attached?
    end
end
