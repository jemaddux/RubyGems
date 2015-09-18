require './test/test_helper'

class NflStatsTest < Minitest::Test
  def test_exists
    assert NflStats
  end

  def test_returns_json_object
    VCR.use_cassette('one_car') do
      json_response = NflStats.api("01/01/2014")
      assert_equal json_response.keys, ["2012010101", "nextupdate"]
      assert_equal json_response["nextupdate"], 345
      assert_equal json_response["2012010101"].keys, ["home", "away", "drives", "scrsummary", "weather", "media", "yl", "qtr", "note", "down", "togo", "redzone", "clock", "posteam", "stadium"]
    end
  end
end