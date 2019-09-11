class ApplicationController < ActionController::Base
    helper_method :current_user, :player1, :player2

    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def player1
        @player1 ||= Player.find(session[:player1_id]) if session[:player1_id]
    end
    
    def player2
        @player2 ||= Player.find(session[:player2_id]) if session[:player2_id]
    end

    def require_authentication
        if !logged_in?
            redirect_to '/login'
        end
    end
end
