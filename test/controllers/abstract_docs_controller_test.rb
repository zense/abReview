require 'test_helper'

class AbstractDocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @abstract_doc = abstract_docs(:one)
  end

  test "should get index" do
    get abstract_docs_url
    assert_response :success
  end

  test "should get new" do
    get new_abstract_doc_url
    assert_response :success
  end

  test "should create abstract_doc" do
    assert_difference('AbstractDoc.count') do
      post abstract_docs_url, params: { abstract_doc: { abstract_data: @abstract_doc.abstract_data, category_id: @abstract_doc.category_id, title: @abstract_doc.title, user_id: @abstract_doc.user_id } }
    end

    assert_redirected_to abstract_doc_url(AbstractDoc.last)
  end

  test "should show abstract_doc" do
    get abstract_doc_url(@abstract_doc)
    assert_response :success
  end

  test "should get edit" do
    get edit_abstract_doc_url(@abstract_doc)
    assert_response :success
  end

  test "should update abstract_doc" do
    patch abstract_doc_url(@abstract_doc), params: { abstract_doc: { abstract_data: @abstract_doc.abstract_data, category_id: @abstract_doc.category_id, title: @abstract_doc.title, user_id: @abstract_doc.user_id } }
    assert_redirected_to abstract_doc_url(@abstract_doc)
  end

  test "should destroy abstract_doc" do
    assert_difference('AbstractDoc.count', -1) do
      delete abstract_doc_url(@abstract_doc)
    end

    assert_redirected_to abstract_docs_url
  end
end
