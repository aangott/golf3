class Player < ActiveRecord::Base

  default_scope { where(active: true) }
  scope :core, -> { where("flight IN ('First', 'Second')") }

  FLIGHTS = ['First', 'Second', 'Substitute']

  def full_name 
    [first_name, last_name, suffix].join(' ')
  end

  def num_full_name
    "#{number} - #{full_name}"
  end

end
