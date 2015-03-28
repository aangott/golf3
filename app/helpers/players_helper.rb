module PlayersHelper

  def display_player(player)
    return player.num_short_name_avg if player
  end
end
