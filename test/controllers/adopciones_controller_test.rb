require "test_helper"

class AdopcionesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get adopciones_new_url
    assert_response :success
  end

  test "should get create" do
    get adopciones_create_url
    assert_response :success
  end
end
