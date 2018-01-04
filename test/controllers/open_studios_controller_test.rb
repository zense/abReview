require 'test_helper'

class OpenStudiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @open_studio = open_studios(:one)
  end

  test "should get index" do
    get open_studios_url
    assert_response :success
  end

  test "should get new" do
    get new_open_studio_url
    assert_response :success
  end

  test "should create open_studio" do
    assert_difference('OpenStudio.count') do
      post open_studios_url, params: { open_studio: { affiliation: @open_studio.affiliation, email: @open_studio.email, interested_in: @open_studio.interested_in, name: @open_studio.name } }
    end

    assert_redirected_to open_studio_url(OpenStudio.last)
  end

  test "should show open_studio" do
    get open_studio_url(@open_studio)
    assert_response :success
  end

  test "should get edit" do
    get edit_open_studio_url(@open_studio)
    assert_response :success
  end

  test "should update open_studio" do
    patch open_studio_url(@open_studio), params: { open_studio: { affiliation: @open_studio.affiliation, email: @open_studio.email, interested_in: @open_studio.interested_in, name: @open_studio.name } }
    assert_redirected_to open_studio_url(@open_studio)
  end

  test "should destroy open_studio" do
    assert_difference('OpenStudio.count', -1) do
      delete open_studio_url(@open_studio)
    end

    assert_redirected_to open_studios_url
  end
end
