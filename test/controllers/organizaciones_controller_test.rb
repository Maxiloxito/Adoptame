require "test_helper"

class OrganizacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get organizaciones_new_url
    assert_response :success
  end

  test "should get create" do
    get organizaciones_create_url
    assert_response :success
  end
end
