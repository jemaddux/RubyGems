require "nfl_stats/version"
require 'faraday'
require 'json'

API_URL = "http://www.nfl.com/liveupdate/game-center/2012010101/2012010101_gtd.json"

module NflStats
  def self.api(date)
    response = Faraday.get(API_URL)
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
