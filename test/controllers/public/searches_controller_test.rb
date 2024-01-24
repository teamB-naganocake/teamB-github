require "test_helper"

class Public::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get genre_search" do
    get public_searches_genre_search_url
    assert_response :success
  end
end
