require "test_helper"

class HealthEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get health_entries_index_url
    assert_response :success
  end

  test "should get show" do
    get health_entries_show_url
    assert_response :success
  end

  test "should get new" do
    get health_entries_new_url
    assert_response :success
  end

  test "should get edit" do
    get health_entries_edit_url
    assert_response :success
  end
end
