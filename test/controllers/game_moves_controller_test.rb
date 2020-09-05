require 'test_helper'

class GameMovesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get game_moves_new_url
    assert_response :success
  end

end
