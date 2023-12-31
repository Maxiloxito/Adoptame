require "test_helper"

class ColectasUsuariosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get colectas_usuarios_index_url
    assert_response :success
  end
end
