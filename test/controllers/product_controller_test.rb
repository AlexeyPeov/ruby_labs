require "test_helper"

class ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get BuyersController" do
    get product_BuyerController_url
    assert_response :success
  end

  test "should get SellersController" do
    get product_SellerController_url
    assert_response :success
  end
end
