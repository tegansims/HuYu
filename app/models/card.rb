class Card < ApplicationRecord
    has_many :boardcards
    has_many :boards, through: :boardcards

end
