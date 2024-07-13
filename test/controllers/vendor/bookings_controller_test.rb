require "test_helper"

class Vendor::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vendor_bookings_index_url
    assert_response :success
  end

  test "should get show" do
    get vendor_bookings_show_url
    assert_response :success
  end

  test "should get edit" do
    get vendor_bookings_edit_url
    assert_response :success
  end

  test "should get update" do
    get vendor_bookings_update_url
    assert_response :success
  end
end
