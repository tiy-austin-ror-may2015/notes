class Game < ActiveRecord::Base

  def self.win_count
    Game.where(has_won: true).count
  end

  def self.loss_count
    Game.where(has_won: false).count
  end

  #def self.win_percent
  #  win_count / (Game.count)
  #end

  def outcome
    if has_won == true
      "Won"
    else
      "Lost"
    end
  end
end
