require "test_helper"

class CampsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get camps_show_url
    assert_response :success
  end

  test "should get index" do
    get camps_index_url
    assert_response :success
  end

  test "should get edit" do
    get camps_edit_url
    assert_response :success
  end
end
