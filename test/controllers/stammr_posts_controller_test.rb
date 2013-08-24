require 'test_helper'

class StammrPostsControllerTest < ActionController::TestCase
  setup do
    @stammr_post = stammr_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stammr_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stammr_post" do
    assert_difference('StammrPost.count') do
      post :create, stammr_post: { content: @stammr_post.content }
    end

    assert_redirected_to stammr_post_path(assigns(:stammr_post))
  end

  test "should show stammr_post" do
    get :show, id: @stammr_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stammr_post
    assert_response :success
  end

  test "should update stammr_post" do
    patch :update, id: @stammr_post, stammr_post: { content: @stammr_post.content }
    assert_redirected_to stammr_post_path(assigns(:stammr_post))
  end

  test "should destroy stammr_post" do
    assert_difference('StammrPost.count', -1) do
      delete :destroy, id: @stammr_post
    end

    assert_redirected_to stammr_posts_path
  end
end
