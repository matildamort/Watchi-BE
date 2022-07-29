class ShowSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :description, :crunchyroll, :netflix, :funimation, :episodes, :airdate, :enddate, :reviews, :image, :image_url
  
  def image
    if object.image.attached?
      {
        url: rails_blob_url(object.image)
      }
    end
  end
end
