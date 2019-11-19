class Player < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_one :board 
  
  def username=(username)
    u = User.find_by(username: username)
    self.user = u
    self.save
  end

  def username
    if self.user
      self.user.username
    else
      nil
    end
  end




end
