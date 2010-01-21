require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  LOGIN = "foobar"
  PASS = "bazquux"

  def make_test_user_for_login
    res = post :create, :user => {
      :name => "goodusername",
      :login => LOGIN,
      :password => PASS,
      :password_confirmation => PASS,
      :age => 1,
      :email => "foo@barbaz.com"
    }
    @current_user_id = res.redirected_to.id
  end

  def remove_test_user_for_login
    delete :destroy, :id => @current_user_id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => {
        :name => "Real Name",
        :login => "username",
        :password => "password",
        :password_confirmation => "password",
        :age => 1,
        :email => "foo@bar.com"
      }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, :id => users(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    # can't edit if not logged in
    get :edit, :id => users(:one).to_param
    assert_response 302

    # make user, log in, edit, delete
    make_test_user_for_login
    post :login, :login => LOGIN, :password => PASS
    get :edit, :id => @current_user_id
    assert_response :success
    remove_test_user_for_login
  end

  test "should update user" do
    # can't update if not logged in
    put :update, :id => users(:one).to_param, :user => { :email => "something@else.com" }
    assert_response 302

    # make user, log in, update, delete
    make_test_user_for_login
    post :login, :login => LOGIN, :password => PASS
    put :update, :id => @current_user_id, :user => {
      :email => "something@else.com"
    }
    assert_redirected_to user_path(assigns(:user))
    remove_test_user_for_login
  end

  test "should destroy user" do
    # can't delete if not logged in
    delete :destroy, :id => users(:one).to_param
    assert_response 302

    # make user, log in, delete
    make_test_user_for_login
    post :login, :login => LOGIN, :password => PASS
    assert_difference('User.count', -1) do
      delete :destroy, :id => @current_user_id
    end
    assert_redirected_to users_path
  end
end
