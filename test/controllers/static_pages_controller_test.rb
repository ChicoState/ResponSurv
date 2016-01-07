require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get question" do
    get :question
    assert_response :success
  end

  test "should get pictures" do
    get :pictures
    assert_response :success
  end

end
