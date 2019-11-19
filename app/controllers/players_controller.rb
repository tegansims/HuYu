class PlayersController < ApplicationController
    before_action :require_authentication

    def new
        @player = Player.new
        @users = User.all.select{|u| u != current_user && u.username != 'COMPUTER'}

    end

    def create
        user = User.find_by(username: params[:player][:username])
        if user && user.authenticate(params[:player][:password])
            if user.username == "COMPUTER"
                flash[:errors] = ["If you want to play against the computer, select 1 Player game."]
                redirect_to new_game_path
            elsif user == current_user
                flash[:errors] = ["Choose a user other than yourself to play against"]
                redirect_to new_player_path
            else

                @player2 = Player.create(user_id: user.id, game_id: session[:game_id])
                session[:player2_id] = @player2.id
                @player2.board = Board.new 
                @player2.board.cards << Card.all
                @player2.board.questions << Question.all
                @player2.save
                session[:board2_id] = @player2.board.id
                redirect_to "/players/#{player1.id}/card_pick_form"
            end
        else
            flash[:errors] = ["No user exists with that username and password. Try again!"]
            redirect_to new_player_path
        end
    end

    def card_pick_form
        @cards = Card.all
        @player = Player.find(params[:id])
    end

    def card_pick_save
        card_picked = Card.find(params[:player][:card_picked])
        player = Player.find(params[:id])
        player.card_picked = card_picked.id
        player.save
        if !player2.card_picked
            redirect_to "/players/#{player2.id}/card_pick_form"
        else
            redirect_to board_path(player1.board)
        end
    end

end
