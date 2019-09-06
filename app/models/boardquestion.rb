class Boardquestion < ApplicationRecord
  belongs_to :board
  belongs_to :question
end
