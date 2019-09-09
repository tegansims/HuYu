class User < ApplicationRecord
    has_many :players
    has_many :games, through: :players
    # has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true

    # def self.exclude_current_user
    #     all.select{|u| u != current_user }
    # end
end
