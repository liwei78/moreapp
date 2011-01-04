require 'test_helper'

class AppsControllerTest < ActionController::TestCase
  setup do
    @app = apps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apps)
  end
  
  test "should get ipad" do
    get :ipad
    assert_response :success
    assert_not_nil assigns(:apps)
  end

  test "should show app" do
    get :show, :id => @app.to_param
    assert_response :success
  end

end
