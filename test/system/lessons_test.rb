require "application_system_test_case"

class LessonsTest < ApplicationSystemTestCase
  setup do
    @lesson = lessons(:one)
  end

  test "visiting the index" do
    visit lessons_url
    assert_selector "h1", text: "Lessons"
  end

  test "should create lesson" do
    visit lessons_url
    click_on "New lesson"

    fill_in "Content", with: @lesson.content
    fill_in "End", with: @lesson.end
    fill_in "Hourly pay", with: @lesson.hourly_pay
    fill_in "Month", with: @lesson.month
    fill_in "Monthly pay", with: @lesson.monthly_pay
    fill_in "Name", with: @lesson.name
    fill_in "Room", with: @lesson.room_id
    fill_in "School", with: @lesson.school_id
    fill_in "Start", with: @lesson.start
    click_on "Create Lesson"

    assert_text "Lesson was successfully created"
    click_on "Back"
  end

  test "should update Lesson" do
    visit lesson_url(@lesson)
    click_on "Edit this lesson", match: :first

    fill_in "Content", with: @lesson.content
    fill_in "End", with: @lesson.end
    fill_in "Hourly pay", with: @lesson.hourly_pay
    fill_in "Month", with: @lesson.month
    fill_in "Monthly pay", with: @lesson.monthly_pay
    fill_in "Name", with: @lesson.name
    fill_in "Room", with: @lesson.room_id
    fill_in "School", with: @lesson.school_id
    fill_in "Start", with: @lesson.start
    click_on "Update Lesson"

    assert_text "Lesson was successfully updated"
    click_on "Back"
  end

  test "should destroy Lesson" do
    visit lesson_url(@lesson)
    click_on "Destroy this lesson", match: :first

    assert_text "Lesson was successfully destroyed"
  end
end
