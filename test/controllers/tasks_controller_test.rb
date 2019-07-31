# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test 'should redirect create when not when logged in' do
    assert_no_difference 'Task.count' do
      post tasks_url, params: { task: { content: @task.content } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Task.count' do
      delete task_url(@task)
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy for wrong task' do
    log_in_as(users(:migo))
    task = tasks(:three)
    assert_no_difference 'tasks.count' do
      delete task_url(task)
    end
    assert_redirected_to root_url
  end
end
