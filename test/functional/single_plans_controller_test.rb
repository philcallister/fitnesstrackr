require 'test_helper'

class SinglePlansControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:single_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create single_plan" do
    assert_difference('SinglePlan.count') do
      post :create, :single_plan => { }
    end

    assert_redirected_to single_plan_path(assigns(:single_plan))
  end

  test "should show single_plan" do
    get :show, :id => single_plans(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => single_plans(:one).to_param
    assert_response :success
  end

  test "should update single_plan" do
    put :update, :id => single_plans(:one).to_param, :single_plan => { }
    assert_redirected_to single_plan_path(assigns(:single_plan))
  end

  test "should destroy single_plan" do
    assert_difference('SinglePlan.count', -1) do
      delete :destroy, :id => single_plans(:one).to_param
    end

    assert_redirected_to single_plans_path
  end
end
