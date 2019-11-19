class BoardsController < ApplicationController
    before_action :find_board, only: [:show, :update]

    def show
        @cards = @board.cards
        @questions = @board.questions
        @player = @board.player
        
        @questions_asked = @board.player == player1 ? session[:questions_asked_1] : session[:questions_asked_2]
        question_attribute_types
        get_question_vals
    end

    def update
        picked_card
        
        @question = Question.find_by(question_params)

        if !@question
            flash[:errors] = ["Please, pick a valid question"]
            redirect_to board_path(params[:id]) and return
        end

        get_matching_cards
        refactor_board
        add_question_to_questions_asked
        
        if @question.attribute_value == @picked_card.name
            if @board.player.id == player1.id
                Game.find(session[:game_id]).update(winner: player1.user_id)
                Game.find(session[:game_id]).update(loser: player2.user_id)
            else
                Game.find(session[:game_id]).update(winner: player2.user_id)
                Game.find(session[:game_id]).update(loser: player1.user_id)
            end
            # flash[:notice] = "#{@board.player.user.username} won the game!"
            redirect_to celebration_path
        
        elsif @board.player.id == player1.id
            if player2.user.username == "COMPUTER"
                @picked_card = Card.find(player1.card_picked)
                @board = player2.board
                if @board.cards.count <= 5
                    @question = player2.board.questions.sample
                else
                    @question = player2.board.questions.select{|q| q.attribute_type != "name"}.sample
                end
                if @question.attribute_value == @picked_card.name
                    Game.find(session[:game_id]).update(winner: player2.user_id)
                    Game.find(session[:game_id]).update(loser: player1.user_id)
                    redirect_to celebration_path and return
                else
                    @matching_cards = @board.cards.where("#{@question[:attribute_type]} = '#{@question[:attribute_value]}'")
                    refactor_board
                end
                flash[:computer] = "The computer has asked, '#{@question.attribute_type}' = '#{@question.attribute_value}'? It only has #{@board.cards.count} cards left!"
                redirect_to player1.board
            else
                redirect_to player2.board
            end
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
            session[:last_q_correct?] = true
            @board.cards = @matching_cards
        else
            session[:last_q_correct?] = false
            @board.cards -= @matching_cards
        end
        available_attribute_values = @board.cards.map{|card| card.get_attribute_values}.flatten
        attributes_common_to_all = available_attribute_values.select{|attribute_value| available_attribute_values.count(attribute_value) == @board.cards.count}
        if @board.cards.length == 1
            @board.questions = []
            @board.questions << Question.all.find_by(attribute_value: @board.cards.first.name)
        else
            attribute_values_left = (available_attribute_values - attributes_common_to_all).uniq
            @board.questions = @board.questions.select{|question| attribute_values_left.any?(question.attribute_value)}
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

    def add_question_to_questions_asked
        session[:questions_asked_1] ||= []
        session[:questions_asked_2] ||= []
        if @board.player == player1
            last_question_asked = @question ? "#{session[:last_q_correct?] ? 'CORRECT' : 'INCORRECT'}! You asked:\nCategory - #{@question.attribute_type.gsub('_', ' ').capitalize}, Value - #{@question.attribute_value}" : nil
            session[:questions_asked_1] << last_question_asked if last_question_asked
        else
            last_question_asked = @question ? "#{session[:last_q_correct?] ? 'CORRECT' : 'INCORRECT'}! You asked:\nCategory - #{@question.attribute_type.gsub('_', ' ').capitalize}, Value - #{@question.attribute_value}" : nil
            session[:questions_asked_2] << last_question_asked if last_question_asked
        end
    end

end
