class BoardsController < ApplicationController
    before_action :find_board, only: [:show, :update]

    def show
        @cards = @board.cards
        @questions = @board.questions
        @questions_attributes = @questions.map{|q| q.attribute_type }.uniq
        @questions_values = @questions.map{|q| q.attribute_value }.uniq
    end

    def update
        picked_card
        
        @question = Question.find_by(question_params)
        get_matching_cards
        refactor_board
        
        if @matching_cards.length == 1
            flash[:notice] = "#{@board.player.user.username} won the game!"
            redirect_to root_path
        elsif @board.player.id == player1.id
            redirect_to player2.board
        else
            redirect_to player1.board
        end
    end

    private

    def find_board
        @board = Board.find(params[:id])
    end

    def question_params
        params.require(:question).permit(:attribute_type, :attribute_value)
    end

    def picked_card
        if player1 == @board.player
            @picked_card = Card.find(player2.card_picked)
        else
            @picked_card = Card.find(player1.card_picked)
        end
    end

    def get_matching_cards 
        @matching_cards = @board.cards.where("#{question_params[:attribute_type]} = '#{question_params[:attribute_value]}'")
    end

    def refactor_board
        if @matching_cards.include?(@picked_card)
            @board.cards = @matching_cards
            @board.questions -= @board.questions.select{|q| q.attribute_type == question_params[:attribute_type]}
        else
            @board.cards -= @matching_cards
            @board.questions.delete(@question)
        end
        @board.save
    end
end
