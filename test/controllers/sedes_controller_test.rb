require "test_helper"

class SedesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sedes_index_url
    assert_response :success
  end

  test "should get new" do
    get sedes_new_url
    assert_response :success
  end

  test "should get create" do
    get sedes_create_url
    assert_response :success
  end

  test "should get edit" do
    get sedes_edit_url
    assert_response :success
  end

  test "should get update" do
    get sedes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get sedes_destroy_url
    assert_response :success
  end
end
