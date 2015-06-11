require 'test_helper'

class WitsControllerTest < ActionController::TestCase
  setup do
    @wit = wits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wit" do
    assert_difference('Wit.count') do
      post :create, wit: { body: @wit.body, user_id: @wit.user_id }
    end

    assert_redirected_to wit_path(assigns(:wit))
  end

  test "should show wit" do
    get :show, id: @wit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wit
    assert_response :success
  end

  test "should update wit" do
    patch :update, id: @wit, wit: { body: @wit.body, user_id: @wit.user_id }
    assert_redirected_to wit_path(assigns(:wit))
  end

  test "should destroy wit" do
    assert_difference('Wit.count', -1) do
      delete :destroy, id: @wit
    end

    assert_redirected_to wits_path
  end
end
