class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_one :watchlist, dependent: :destroy
    has_many :shows, through: :watchlists
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true  
end
