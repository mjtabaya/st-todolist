# frozen_string_literal: true

require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = lists(:one)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'List.count' do
      post lists_url, params: { list: { name: @list.name } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'List.count' do
      delete list_url(@list)
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy for wrong list' do
    log_in_as(users(:migo))
    list = lists(:three)
    assert_no_difference 'lists.count' do
      delete list_url(list)
    end
    assert_redirected_to root_url
  end
end
