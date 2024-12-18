require "test_helper"

class CalculatorsControllerTest < ActionDispatch::IntegrationTest
  test "should return 0 when empty string is passed" do 
    post calculators_add_url, params: { numbers: "" }
    assert_response :success
    assert_equal "0", response.body
  end
  
end
