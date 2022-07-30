class ShowSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :description, :crunchyroll, :netflix, :funimation, :episodes, :airdate, :enddate, :reviews, :picture, :picture_url
end
