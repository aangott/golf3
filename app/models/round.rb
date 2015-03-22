class Round < ActiveRecord::Base

  has_many :matches

  COURSES = ['Front 9', 'Back 9', 'No Golf']

  def self.last_scored
    Round.order('date DESC').includes(matches: :scores).detect { |r| r.scored? }
  end

  def self.this_year
    Round.all.select { |r| r.this_year? }
  end

  def self.matches_per_round 
    (Player.core.count / 2.0).round
  end

  def scored?
    matches.map { |m| m.scored? }.any?
  end

  def in_past?
    persisted? && date < Date.today
  end

  def this_year?
    date.year == Time.now.year
  end

end
