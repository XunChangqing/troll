require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { check_at: @task.check_at, check_result: @task.check_result, checker_id: @task.checker_id, finish_at: @task.finish_at, owner_id: @task.owner_id, request_at: @task.request_at, result: @task.result, url: @task.url }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, task: { check_at: @task.check_at, check_result: @task.check_result, checker_id: @task.checker_id, finish_at: @task.finish_at, owner_id: @task.owner_id, request_at: @task.request_at, result: @task.result, url: @task.url }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
