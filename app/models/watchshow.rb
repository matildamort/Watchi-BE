class Watchshow < ApplicationRecord
has_many :shows, dependent: :destroy
belongs_to :watchlists, optional: true, dependent: :destroy

end
