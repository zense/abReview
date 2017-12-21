require 'test_helper'

class AbstractDosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @abstract_doc = abstract_dos(:one)
  end

  test "should get index" do
    get abstract_dos_url
    assert_response :success
  end

  test "should get new" do
    get new_abstract_do_url
    assert_response :success
  end

  test "should create abstract_doc" do
    assert_difference('AbstractDo.count') do
      post abstract_dos_url, params: { abstract_doc: { attachment: @abstract_doc.attachment, category_id: @abstract_doc.category_id, title: @abstract_doc.title, user_id: @abstract_doc.user_id } }
    end

    assert_redirected_to abstract_do_url(AbstractDo.last)
  end

  test "should show abstract_doc" do
    get abstract_do_url(@abstract_doc)
    assert_response :success
  end

  test "should get edit" do
    get edit_abstract_do_url(@abstract_doc)
    assert_response :success
  end

  test "should update abstract_doc" do
    patch abstract_do_url(@abstract_doc), params: { abstract_doc: { attachment: @abstract_doc.attachment, category_id: @abstract_doc.category_id, title: @abstract_doc.title, user_id: @abstract_doc.user_id } }
    assert_redirected_to abstract_do_url(@abstract_doc)
  end

  test "should destroy abstract_doc" do
    assert_difference('AbstractDo.count', -1) do
      delete abstract_do_url(@abstract_doc)
    end

    assert_redirected_to abstract_dos_url
  end
end
