class StatsController < ApplicationController

  def score_history
    @categorized_players = {
      'First Flight' =>  Player.where(flight: 'First'),
      'Second Flight' => Player.where(flight: 'Second'),
      'Substitutes' => Player.where(flight: 'Substitute')
    }
  end

end
