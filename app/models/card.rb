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

end
