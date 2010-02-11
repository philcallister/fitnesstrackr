require 'test_helper'

class SinglePlanSetsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:single_plan_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create single_plan_set" do
    assert_difference('SinglePlanSet.count') do
      post :create, :single_plan_set => { }
    end

    assert_redirected_to single_plan_set_path(assigns(:single_plan_set))
  end

  test "should show single_plan_set" do
    get :show, :id => single_plan_sets(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => single_plan_sets(:one).to_param
    assert_response :success
  end

  test "should update single_plan_set" do
    put :update, :id => single_plan_sets(:one).to_param, :single_plan_set => { }
    assert_redirected_to single_plan_set_path(assigns(:single_plan_set))
  end

  test "should destroy single_plan_set" do
    assert_difference('SinglePlanSet.count', -1) do
      delete :destroy, :id => single_plan_sets(:one).to_param
    end

    assert_redirected_to single_plan_sets_path
  end
end
