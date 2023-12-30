require "test_helper"

class ColectaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get colecta_index_url
    assert_response :success
  end

  test "should get new" do
    get colecta_new_url
    assert_response :success
  end

  test "should get edit" do
    get colecta_edit_url
    assert_response :success
  end
end
