require "test_helper"

class SessionOrganizacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get session_organizaciones_new_url
    assert_response :success
  end

  test "should get create" do
    get session_organizaciones_create_url
    assert_response :success
  end
end
