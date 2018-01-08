require 'test_helper'

class AdministrationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administration_index_url
    assert_response :success
  end

end
