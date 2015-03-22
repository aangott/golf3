class Point < ActiveRecord::Base
  belongs_to :match
  belongs_to :player

  delegate :this_year?, to: :match, allow_nil: true
  delegate :round, to: :match, allow_nil: true
end