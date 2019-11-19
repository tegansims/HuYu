class User < ApplicationRecord
    has_many :players
    has_many :games, through: :players
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true


    # leaderboard analytics #

    def self.winners    
        User.all.sort_by{|user| user.percentage_won}.reverse
    end
    
    def games_played
        Game.all.select{|game| game.winner == self.id || game.loser == self.id}
    end
    
    def games_won
        Game.all.select{|game| game.winner == self.id}.count
    end
    
    def percentage_won
        if self.games_played.count == 0
            0
        else
            self.games_won / self.games_played.count.to_f * 100
        end
    end


    # nemesis analytics #
    def exclude_self
        User.all.select{|user| user != self}
    end

    def nemesis_ordered
        self.exclude_self.sort_by {|user| self.percentage_won_against(user)}
    end

    def games_played_against(opponent)
        self.games_played.select{|game| game.winner == opponent.id || game.loser == opponent.id}.count
    end
    
    def games_won_against(opponent)
        self.games_played.select{|game| game.loser == opponent.id}.count
    end

    def percentage_won_against(opponent)
        if games_played_against(opponent) == 0
            0
        else
            percent = self.games_won_against(opponent) / self.games_played_against(opponent).to_f * 100
            percent.round(2) 
        end
    end

    def played_games?
        played = Player.all.select{|player| player.card_picked != nil}
        played.map{|player| player.user_id}.include?(self.id)
    end    

    def player_picked_cards
        Player.all.select{|player| player.user_id == self.id && player.card_picked != nil}
    end

    def player_picked_cards_ids
        player_picked_cards.map{|player| player.card_picked}
    end 

    def most_picked_card 
        player_picked_cards_ids.max_by {|id| player_picked_cards_ids.count(id)}
    end

    def most_picked_card_name
        if played_games?
            Card.find(self.most_picked_card).name
        else
            "No card"
        end
    end
    
end

