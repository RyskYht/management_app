require "application_system_test_case"

class TuitionsTest < ApplicationSystemTestCase
  setup do
    @tuition = tuitions(:one)
  end

  test "visiting the index" do
    visit tuitions_url
    assert_selector "h1", text: "Tuitions"
  end

  test "should create tuition" do
    visit tuitions_url
    click_on "New tuition"

    fill_in "Amount", with: @tuition.amount
    fill_in "Deadline date", with: @tuition.deadline_date
    fill_in "Family", with: @tuition.family_id
    fill_in "Month", with: @tuition.month
    fill_in "Payment date", with: @tuition.payment_date
    fill_in "School", with: @tuition.school_id
    fill_in "Title", with: @tuition.title
    click_on "Create Tuition"

    assert_text "Tuition was successfully created"
    click_on "Back"
  end

  test "should update Tuition" do
    visit tuition_url(@tuition)
    click_on "Edit this tuition", match: :first

    fill_in "Amount", with: @tuition.amount
    fill_in "Deadline date", with: @tuition.deadline_date
    fill_in "Family", with: @tuition.family_id
    fill_in "Month", with: @tuition.month
    fill_in "Payment date", with: @tuition.payment_date
    fill_in "School", with: @tuition.school_id
    fill_in "Title", with: @tuition.title
    click_on "Update Tuition"

    assert_text "Tuition was successfully updated"
    click_on "Back"
  end

  test "should destroy Tuition" do
    visit tuition_url(@tuition)
    click_on "Destroy this tuition", match: :first

    assert_text "Tuition was successfully destroyed"
  end
end
