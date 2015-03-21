class Player < ActiveRecord::Base
  has_many :scores
  has_many :points

  default_scope { where(active: true) }
  scope :core, -> { where("flight IN ('First', 'Second')") }

  FLIGHTS = ['First', 'Second', 'Substitute']

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

end
