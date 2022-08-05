class Show < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_one_attached :picture
    # belongs_to :watchshows, dependent: :destroy
    # has_many :watchlists, dependent: :destroy
   
    

    def picture_url
        Rails.application.routes.url_helpers.url_for(picture) if picture.attached?
    end
end
