require 'test_helper'

class GameUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get game_users_new_url
    assert_response :success
  end

end
