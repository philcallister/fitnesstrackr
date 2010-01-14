require 'test_helper'

class CardioPlansControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cardio_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cardio_plan" do
    assert_difference('CardioPlan.count') do
      post :create, :cardio_plan => { }
    end

    assert_redirected_to cardio_plan_path(assigns(:cardio_plan))
  end

  test "should show cardio_plan" do
    get :show, :id => cardio_plans(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cardio_plans(:one).to_param
    assert_response :success
  end

  test "should update cardio_plan" do
    put :update, :id => cardio_plans(:one).to_param, :cardio_plan => { }
    assert_redirected_to cardio_plan_path(assigns(:cardio_plan))
  end

  test "should destroy cardio_plan" do
    assert_difference('CardioPlan.count', -1) do
      delete :destroy, :id => cardio_plans(:one).to_param
    end

    assert_redirected_to cardio_plans_path
  end
end
