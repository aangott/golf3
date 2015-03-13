class Player < ActiveRecord::Base

  default_scope { where(active: true) }

  FLIGHTS = ['First', 'Second', 'Substitute']

  def full_name 
    [first_name, last_name, suffix].join(' ')
  end

end
