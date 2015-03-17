module PlayersHelper

  def display_player(player)
    return player.num_short_name if player
    "Player not yet selected"
  end
end
