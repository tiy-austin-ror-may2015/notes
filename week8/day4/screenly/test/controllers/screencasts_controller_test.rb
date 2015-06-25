require 'test_helper'

class ScreencastsControllerTest < ActionController::TestCase
  setup do
    @screencast = screencasts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:screencasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create screencast" do
    assert_difference('Screencast.count') do
      post :create, screencast: { price: @screencast.price, title: @screencast.title, url: @screencast.url }
    end

    assert_redirected_to screencast_path(assigns(:screencast))
  end

  test "should show screencast" do
    get :show, id: @screencast
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @screencast
    assert_response :success
  end

  test "should update screencast" do
    patch :update, id: @screencast, screencast: { price: @screencast.price, title: @screencast.title, url: @screencast.url }
    assert_redirected_to screencast_path(assigns(:screencast))
  end

  test "should destroy screencast" do
    assert_difference('Screencast.count', -1) do
      delete :destroy, id: @screencast
    end

    assert_redirected_to screencasts_path
  end
end
