class Boardcard < ApplicationRecord
  belongs_to :card
  belongs_to :board
end
