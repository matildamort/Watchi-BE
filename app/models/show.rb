class Show < ApplicationRecord
    has_many :reviews

#     def transform_show
#         return { 
            
#             id: self.id,
#             title: self.title,
#             description: self.description,
#             crunchroll: self.crunchroll,
#             netflix: self.netflix,
#             funimation: self.funimation,
#             episodes: self.episodes,
#             airdate: self.airdate,
#             enddate: self.enddate,
#             reviews: self.reviews.map { |review| review.transform_review }
#          }
# end


end
