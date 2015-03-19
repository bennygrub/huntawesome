require 'test_helper'

class TaskDocumentationsControllerTest < ActionController::TestCase
  setup do
    @task_documentation = task_documentations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_documentations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_documentation" do
    assert_difference('TaskDocumentation.count') do
      post :create, task_documentation: { description: @task_documentation.description }
    end

    assert_redirected_to task_documentation_path(assigns(:task_documentation))
  end

  test "should show task_documentation" do
    get :show, id: @task_documentation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_documentation
    assert_response :success
  end

  test "should update task_documentation" do
    patch :update, id: @task_documentation, task_documentation: { description: @task_documentation.description }
    assert_redirected_to task_documentation_path(assigns(:task_documentation))
  end

  test "should destroy task_documentation" do
    assert_difference('TaskDocumentation.count', -1) do
      delete :destroy, id: @task_documentation
    end

    assert_redirected_to task_documentations_path
  end
end
