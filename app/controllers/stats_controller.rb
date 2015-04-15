class StatsController < ApplicationController

  def score_history
    @categorized_players = {
      'First Flight' =>  Player.where(flight: 'First').includes(:scores).sort_by { |p| p.number.to_i },
      'Second Flight' => Player.where(flight: 'Second').includes(:scores).sort_by(&:number),
      'Substitutes' => Player.where(flight: 'Substitute').includes(:scores).sort_by(&:last_name)
    }
  end

  def rankings
    @last_scored_round = Round.last_scored
    players_by_points = Player.core.includes(:scores).includes(:points)
    sorted_players = players_by_points.sort_by(&:total_points).reverse
    @categorized_players = {
      'First Flight' =>  sorted_players.select { |p| p.flight == 'First' },
      'Second Flight' => sorted_players.select { |p| p.flight == 'Second' },
      'Substitutes' => Player.where(flight: 'Substitute').includes(:scores).sort_by(&:last_name)
    }
  end

end
