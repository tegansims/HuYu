class WelcomeController < ApplicationController
  before_action :require_authentication
  
  def home
  end
  
end