require "nfl_stats/version"
require 'faraday'
require 'json'

API_URL = "http://www.nfl.com/liveupdate/game-center/"

module NflStats
  def self.api(date)
    uri = API_URL + date + "/" + date + "_gtd.json"
    response = Faraday.get(uri)
    attributes = JSON.parse(response.body)
    return attributes
  end

  class Game
  end

  class Player
  end

  class Play
  end

  class Drive
  end

  class Schedule
  end

  class Season
  end

  class Team
  end
end
