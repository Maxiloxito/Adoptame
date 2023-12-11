require "test_helper"

class SessionUsuariosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get session_usuarios_new_url
    assert_response :success
  end

  test "should get create" do
    get session_usuarios_create_url
    assert_response :success
  end
end
