class Board < ApplicationRecord
  belongs_to :player
  has_many :boardquestions
  has_many :questions, through: :boardquestions
  has_many :boardcards
  has_many :cards, through: :boardcards
  
end
