# frozen_string_literal: true

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = 'Authentication Template App'
  end

  test 'should get root' do
    get root_path
    assert_response :success
  end

  test 'should get home' do
    get home_path
    assert_response :success
    assert_select 'title', @base_title.to_s
  end
end
