module PlayersHelper

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def player_name(player)
    return "#{player.first_name} #{player.last_name}"
  end

end
