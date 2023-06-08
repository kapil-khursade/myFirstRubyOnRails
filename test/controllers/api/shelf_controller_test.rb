require "test_helper"

class Api::ShelfControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_shelf_index_url
    assert_response :success
  end
end
