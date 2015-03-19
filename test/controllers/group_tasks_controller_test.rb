require 'test_helper'

class GroupTasksControllerTest < ActionController::TestCase
  setup do
    @group_task = group_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_task" do
    assert_difference('GroupTask.count') do
      post :create, group_task: { group_id: @group_task.group_id, task_id: @group_task.task_id }
    end

    assert_redirected_to group_task_path(assigns(:group_task))
  end

  test "should show group_task" do
    get :show, id: @group_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_task
    assert_response :success
  end

  test "should update group_task" do
    patch :update, id: @group_task, group_task: { group_id: @group_task.group_id, task_id: @group_task.task_id }
    assert_redirected_to group_task_path(assigns(:group_task))
  end

  test "should destroy group_task" do
    assert_difference('GroupTask.count', -1) do
      delete :destroy, id: @group_task
    end

    assert_redirected_to group_tasks_path
  end
end
