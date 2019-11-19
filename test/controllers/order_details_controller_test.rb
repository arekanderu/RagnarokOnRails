require 'test_helper'

class OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get cart" do
    get order_details_cart_url
    assert_response :success
  end

end
