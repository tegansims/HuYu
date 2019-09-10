class BoardsController < ApplicationController
    before_action :find_board, only: [:show, :update]

    def show
        @cards = @board.cards
        @questions = @board.questions
        question_attribute_types
        # @questions_values = @questions.map{|q| q.attribute_value }.uniq
        get_question_vals
        
    end

    def update
        
        picked_card
        
        @question = Question.find_by(question_params)
        get_matching_cards
        refactor_board
        
        if @question.attribute_value == @picked_card.name
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

    def question_attribute_types
        @questions_attributes = @questions.map{|q| q.attribute_type }.uniq
    end

    def question_names
        @questions.select{|q| q.attribute_type == 'name' }.map(&:attribute_value)
    end

    def question_hair_types
        @questions.select{|q| q.attribute_type == 'hair_type' }.map(&:attribute_value)
    end

    def question_hair_colors
        @questions.select{|q| q.attribute_type == 'hair_color' }.map(&:attribute_value)
    end

    def question_glasses
        @questions.select{|q| q.attribute_type == 'glasses' }.map(&:attribute_value)
    end

    def question_facial_hairs
        @questions.select{|q| q.attribute_type == 'facial_hair' }.map(&:attribute_value)
    end

    def question_genders
        @questions.select{|q| q.attribute_type == 'gender' }.map(&:attribute_value)
    end

    def question_hats
        @questions.select{|q| q.attribute_type == 'hat' }.map(&:attribute_value)
    end

    def question_eye_colors
        @questions.select{|q| q.attribute_type == 'eye_color' }.map(&:attribute_value)
    end

    def get_question_vals
        @questions_name_values = question_names
        @questions_hair_color_values = question_hair_colors
        @questions_hair_type_values = question_hair_types
        @questions_glasses_values = question_glasses
        @questions_facial_hair_values = question_facial_hairs
        @questions_gender_values = question_genders
        @questions_hat_values = question_hats
        @questions_eye_color_values = question_eye_colors
    end
end
