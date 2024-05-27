require "test_helper"

class CelebritiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get celebrities_new_url
    assert_response :success
  end
end
