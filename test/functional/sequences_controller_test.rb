require 'test_helper'

class SequencesControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get created" do
    get :created
    assert_response :success
  end

  test "should get xml" do
    get :xml
    assert_response :success
  end

end
