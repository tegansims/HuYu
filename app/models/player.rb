class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_one :board
  
  
end
