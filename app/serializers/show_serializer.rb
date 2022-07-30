class ShowSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :description, :crunchyroll, :netflix, :funimation, :episodes, :airdate, :enddate, :reviews, :image

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
  
end
