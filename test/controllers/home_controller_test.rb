require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "not authenicated user should get redirect" do
    get :index
    assert_response :redirect
  end

end
