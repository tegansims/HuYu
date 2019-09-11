class Question < ApplicationRecord
    has_many :boardquestions
    has_many :boards, through: :boardquestions
    
end
