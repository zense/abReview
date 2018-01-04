require 'test_helper'

class OpenHousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @open_house = open_houses(:one)
  end

  test "should get index" do
    get open_houses_url
    assert_response :success
  end

  test "should get new" do
    get new_open_house_url
    assert_response :success
  end

  test "should create open_house" do
    assert_difference('OpenHouse.count') do
      post open_houses_url, params: { open_house: { branch_of_study: @open_house.branch_of_study, email: @open_house.email, institute: @open_house.institute, name: @open_house.name } }
    end

    assert_redirected_to open_house_url(OpenHouse.last)
  end

  test "should show open_house" do
    get open_house_url(@open_house)
    assert_response :success
  end

  test "should get edit" do
    get edit_open_house_url(@open_house)
    assert_response :success
  end

  test "should update open_house" do
    patch open_house_url(@open_house), params: { open_house: { branch_of_study: @open_house.branch_of_study, email: @open_house.email, institute: @open_house.institute, name: @open_house.name } }
    assert_redirected_to open_house_url(@open_house)
  end

  test "should destroy open_house" do
    assert_difference('OpenHouse.count', -1) do
      delete open_house_url(@open_house)
    end

    assert_redirected_to open_houses_url
  end
end
