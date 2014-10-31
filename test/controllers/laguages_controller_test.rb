require 'test_helper'

class LaguagesControllerTest < ActionController::TestCase
  setup do
    @laguage = laguages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laguages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create laguage" do
    assert_difference('Laguage.count') do
      post :create, laguage: { name: @laguage.name, version: @laguage.version }
    end

    assert_redirected_to laguage_path(assigns(:laguage))
  end

  test "should show laguage" do
    get :show, id: @laguage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @laguage
    assert_response :success
  end

  test "should update laguage" do
    patch :update, id: @laguage, laguage: { name: @laguage.name, version: @laguage.version }
    assert_redirected_to laguage_path(assigns(:laguage))
  end

  test "should destroy laguage" do
    assert_difference('Laguage.count', -1) do
      delete :destroy, id: @laguage
    end

    assert_redirected_to laguages_path
  end
end
