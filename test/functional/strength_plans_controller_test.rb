require 'test_helper'

class StrengthPlansControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:strength_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create strength_plan" do
    assert_difference('StrengthPlan.count') do
      post :create, :strength_plan => { }
    end

    assert_redirected_to strength_plan_path(assigns(:strength_plan))
  end

  test "should show strength_plan" do
    get :show, :id => strength_plans(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => strength_plans(:one).to_param
    assert_response :success
  end

  test "should update strength_plan" do
    put :update, :id => strength_plans(:one).to_param, :strength_plan => { }
    assert_redirected_to strength_plan_path(assigns(:strength_plan))
  end

  test "should destroy strength_plan" do
    assert_difference('StrengthPlan.count', -1) do
      delete :destroy, :id => strength_plans(:one).to_param
    end

    assert_redirected_to strength_plans_path
  end
end
