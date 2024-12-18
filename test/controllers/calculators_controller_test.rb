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

  test "should return sum when multiple numbers string is passed" do 
    post calculators_add_url, params: { numbers: "1,2,3,4,5,6,7,8,9,10,11,12,13" }
    assert_response :success
    assert_equal "91", response.body
  end

  test "should saperate string with new line and sum the numbers" do
    post calculators_add_url, params: { numbers: "1\n2,3"  }
    assert_response :success
    assert_equal "6", response.body
  end
  
  test "should return sum of numbers with ; delimiter" do
    post calculators_add_url, params: { numbers: "//;\n1;2;3" }
    assert_response :success
    assert_equal "6", response.body
  end
  
  test "should return sum of numbers with & delimiter" do
    post calculators_add_url, params: { numbers: "//&\n1&2&3" }
    assert_response :success
    assert_equal "6", response.body
  end
end
