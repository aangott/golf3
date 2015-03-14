class Round < ActiveRecord::Base

  COURSES = ['Front 9', 'Back 9', 'No Golf']

  def self.this_year
    Round.all.select { |r| r.date.year == Time.now.year }
  end

  def self.matches_per_round 
    (Player.core.count/2.0).round
  end

end
