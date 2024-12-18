require "test_helper"

class CalculatorsControllerTest < ActionDispatch::IntegrationTest
  test "should return 0 when empty string is passed" do 
    post calculators_add_url, params: { numbers: "" }
    assert_response :success
    assert_equal "0", response.body
  end

  test "should return sum when one number string is passed" do 
    post calculators_add_url, params: { numbers: "1" }
    assert_response :success
    assert_equal "1", response.body
  end

  test "should return sum when two number string is passed" do 
    post calculators_add_url, params: { numbers: "1,2" }
    assert_response :success
    assert_equal "3", response.body
  end
  
end
