require "test_helper"

class JerseysControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get jerseys_edit_url
    assert_response :success
  end

  test "should get update" do
    get jerseys_update_url
    assert_response :success
  end

  test "should get destroy" do
    get jerseys_destroy_url
    assert_response :success
  end
end
