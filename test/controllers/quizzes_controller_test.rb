require 'test_helper'

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "root should get quizzes#index" do
    get root_url
    assert_response :success
    assert_equal "quizzes", @controller.controller_name
    assert_equal "index", @controller.action_name
  end
end
