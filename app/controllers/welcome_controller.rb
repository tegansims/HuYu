class WelcomeController < ApplicationController
  before_action :require_authentication
  
  def home
    session.delete(:questions_asked_1)
    session.delete(:questions_asked_2)
  end
end
