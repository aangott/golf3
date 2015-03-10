class PlayersController < ApplicationController

  def index
    @categorized_players = {
      'First Flight' =>  Player.where(flight: 'First'),
      'Second Flight' => Player.where(flight: 'Second'),
      'Substitutes' => Player.where(flight: 'Substitute'),
      'Inactive' => Player.unscoped.where(active: false)
    }
  end


end
