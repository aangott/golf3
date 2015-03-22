class Score < ActiveRecord::Base
  belongs_to :match
  belongs_to :player

  delegate :date, to: :match, allow_nil: true
  delegate :round, to: :match, allow_nil: true
end