class Game < ActiveRecord::Base
  def outcome
    if has_won == true
      "Won"
    else
      "Lost"
    end
  end
end
