class Game < ApplicationRecord
    has_many :players
    has_many :boards, through: :players
    has_many :users, through: :players

    validates :game_type, presence: true
     
end
