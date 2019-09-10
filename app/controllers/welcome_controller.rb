class WelcomeController < ApplicationController
  before_action :require_authentication
  
  def home
    # @winners = Game.all.map{|game| game.winner_id}
    # @losers = Game.all.map{|game| game.loser_id}
  end
  
end
