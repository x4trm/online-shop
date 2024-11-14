require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_index_url
    assert_response :success
  end

  test "should get manage_users" do
    get admins_manage_users_url
    assert_response :success
  end

  test "should get manage_books" do
    get admins_manage_books_url
    assert_response :success
  end
end
