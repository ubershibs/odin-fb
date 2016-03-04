require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:luke)
    @other = users(:michael)
    sign_in @user 
  end

  def teardown
    sign_out @user 
  end
 
  test "user/show page includes post form when viewing own page" do
    get :show, id: @user 
    assert_response :success
    assert_select "a[href=?]", destroy_user_session_path
    assert_select "textarea[name='post[content]']"
  end

  test "user/show does not include post form when viewing other's page" do
    get :show, id: @other
    assert_response :success
    assert_select "a[href=?]", destroy_user_session_path
    assert_select "textarea[name='post[content]']", count: 0
  end
end
