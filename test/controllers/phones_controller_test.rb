require 'test_helper'

class PhonesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get phones_index_url
    assert_response :success
  end

  test "should get show" do
    get phones_show_url
    assert_response :success
  end

  test "should get edit" do
    get phones_edit_url
    assert_response :success
  end

  test "should get new" do
    get phones_new_url
    assert_response :success
  end

end
