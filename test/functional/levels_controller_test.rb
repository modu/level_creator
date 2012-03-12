require 'test_helper'

class LevelsControllerTest < ActionController::TestCase
  test "should get created" do
    get :created
    assert_response :success
  end

end
