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
    @categorized_players = {
      'First Flight' =>  Player.where(flight: 'First').includes(:scores).includes(:points).sort_by(&:total_points),
      'Second Flight' => Player.where(flight: 'Second').includes(:scores).includes(:points).sort_by(&:total_points),
      'Substitutes' => Player.where(flight: 'Substitute').includes(:scores).includes(:points).sort_by(&:last_name)
    }
  end

end
