require "test_helper"

class Api::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_members_index_url
    assert_response :success
  end
end
