require './test/test_helper'

class NflStatsTest < Minitest::Test
  def test_exists
    assert NflStats
  end

  def test_returns_json_object
    VCR.use_cassette('one_car') do
      date = "2012010101"
      top  = [
        "home", "away", "drives", "scrsummary", "weather", "media", 
        "yl", "qtr", "note", "down", "togo", "redzone", "clock", 
        "posteam", "stadium"
      ]

      stats = NflStats.api("01/01/2014")

      assert_equal stats.keys, [date, "nextupdate"]
      assert_equal stats["nextupdate"], 345
      assert_equal stats[date].keys, top
      assert_equal stats[date]["home"].keys, ["score", "abbr", "to", "stats", "players"]
      assert_equal stats[date]["away"].keys, ["score", "abbr", "to", "stats", "players"]
      assert_equal stats[date]["drives"].keys, ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "crntdrv"]
      assert_equal stats[date]["scrsummary"].keys, ["253", "619", "969", "1231", "1621", "2474", "2889", "3134", "3515", "4041", "4105"]
      assert_equal stats[date]["weather"], nil
      assert_equal stats[date]["media"], nil
      assert_equal stats[date]["yl"], ""
      assert_equal stats[date]["qtr"], "Final"
      assert_equal stats[date]["note"], nil
      assert_equal stats[date]["down"], 0
      assert_equal stats[date]["togo"], 0 
      assert_equal stats[date]["redzone"], true
      assert_equal stats[date]["clock"], "00:22"
      assert_equal stats[date]["posteam"], "NE"
      assert_equal stats[date]["stadium"], nil
    end
  end
end