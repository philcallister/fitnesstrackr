require 'test_helper'

class WorkoutPlansControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workout_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workout_plan" do
    assert_difference('WorkoutPlan.count') do
      post :create, :workout_plan => { }
    end

    assert_redirected_to workout_plan_path(assigns(:workout_plan))
  end

  test "should show workout_plan" do
    get :show, :id => workout_plans(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => workout_plans(:one).to_param
    assert_response :success
  end

  test "should update workout_plan" do
    put :update, :id => workout_plans(:one).to_param, :workout_plan => { }
    assert_redirected_to workout_plan_path(assigns(:workout_plan))
  end

  test "should destroy workout_plan" do
    assert_difference('WorkoutPlan.count', -1) do
      delete :destroy, :id => workout_plans(:one).to_param
    end

    assert_redirected_to workout_plans_path
  end
end
