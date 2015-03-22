module StatsHelper

  def display_score(score)
    return '' unless score
    return score.value unless score.adj_value.present?
    "Orig: #{score.value}, Adj: #{score.adj_value}"
  end

end