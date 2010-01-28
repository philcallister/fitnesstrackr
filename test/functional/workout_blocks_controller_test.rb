require 'test_helper'

class WorkoutBlocksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workout_blocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workout_block" do
    assert_difference('WorkoutBlock.count') do
      post :create, :workout_block => { }
    end

    assert_redirected_to workout_block_path(assigns(:workout_block))
  end

  test "should show workout_block" do
    get :show, :id => workout_blocks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => workout_blocks(:one).to_param
    assert_response :success
  end

  test "should update workout_block" do
    put :update, :id => workout_blocks(:one).to_param, :workout_block => { }
    assert_redirected_to workout_block_path(assigns(:workout_block))
  end

  test "should destroy workout_block" do
    assert_difference('WorkoutBlock.count', -1) do
      delete :destroy, :id => workout_blocks(:one).to_param
    end

    assert_redirected_to workout_blocks_path
  end
end
