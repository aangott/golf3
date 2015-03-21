class Player < ActiveRecord::Base
  has_many :scores
  has_many :points

  default_scope { where(active: true) }
  scope :core, -> { where("flight IN ('First', 'Second')") }

  FLIGHTS = ['First', 'Second', 'Substitute']
  SCORES_FOR_AVERAGE = 10
  MIN_SCORES_FOR_AVG = 3

  def full_name 
    [first_name, last_name, suffix].join(' ')
  end

  def short_name 
    [first_name, "#{last_name[0]}.", suffix].join(' ')
  end

  def num_full_name
    "#{number} - #{full_name}"
  end

  def num_short_name
    "#{number} - #{short_name}"
  end

  def last_scores
    scores_from_matches, old_scores = scores.partition { |s| s.match_id.present? }
    ordered_scores = (
      scores_from_matches.sort_by(&:date).reverse + 
      old_scores.sort_by(&:id).reverse
    )
    ordered_scores.map { |s| s.adj_value || s.value }
  end

  def average_score
    scores_to_avg = last_scores.compact.slice(0, SCORES_FOR_AVERAGE)
    if self.starting_average
      while scores_to_avg.length < MIN_SCORES_FOR_AVG
        scores_to_avg << self.starting_average
      end
    end
    if scores_to_avg.empty?
      return 0
    end
  (scores_to_avg.reduce(:+).to_f / scores_to_avg.length).round(0)
  end

end
