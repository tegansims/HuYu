class Card < ApplicationRecord
    has_many :boardcards
    has_many :boards, through: :boardcards

    def get_attribute_values
        array = []
        array << self.name
        array << self.hair_color
        array << self.hair_type
        array << self.gender
        array << self.hat
        array << self.glasses
        array << self.eye_color
        array << self.facial_hair
        array
    end

    def cards_picked
        Player.all.select{|player| player.card_picked == self.id}
    end

    def times_card_picked
        cards_picked.count
    end
    
    def self.most_picked_card
        Card.all.max_by { |card| card.times_card_picked} 
    end

    
end
