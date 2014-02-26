require 'test_helper'

class PainelControllerTest < ActionController::TestCase
  test "should get cadastrar" do
    get :cadastrar
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

end
