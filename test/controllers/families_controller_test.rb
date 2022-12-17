require "test_helper"

class FamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @family = families(:one)
  end

  test "should get index" do
    get families_url
    assert_response :success
  end

  test "should get new" do
    get new_family_url
    assert_response :success
  end

  test "should create family" do
    assert_difference("Family.count") do
      post families_url, params: { family: { address: @family.address, email: @family.email, login_id: @family.login_id, memo: @family.memo, name: @family.name, password_digest: @family.password_digest, school_id: @family.school_id, tel: @family.tel } }
    end

    assert_redirected_to family_url(Family.last)
  end

  test "should show family" do
    get family_url(@family)
    assert_response :success
  end

  test "should get edit" do
    get edit_family_url(@family)
    assert_response :success
  end

  test "should update family" do
    patch family_url(@family), params: { family: { address: @family.address, email: @family.email, login_id: @family.login_id, memo: @family.memo, name: @family.name, password_digest: @family.password_digest, school_id: @family.school_id, tel: @family.tel } }
    assert_redirected_to family_url(@family)
  end

  test "should destroy family" do
    assert_difference("Family.count", -1) do
      delete family_url(@family)
    end

    assert_redirected_to families_url
  end
end
