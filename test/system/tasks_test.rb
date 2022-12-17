require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "should create task" do
    visit tasks_url
    click_on "New task"

    fill_in "Comment", with: @task.comment
    fill_in "Content", with: @task.content
    fill_in "End", with: @task.end
    fill_in "Finish", with: @task.finish
    fill_in "School", with: @task.school_id
    fill_in "Start", with: @task.start
    fill_in "Student", with: @task.student_id
    fill_in "Teacher", with: @task.teacher_id
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "should update Task" do
    visit task_url(@task)
    click_on "Edit this task", match: :first

    fill_in "Comment", with: @task.comment
    fill_in "Content", with: @task.content
    fill_in "End", with: @task.end
    fill_in "Finish", with: @task.finish
    fill_in "School", with: @task.school_id
    fill_in "Start", with: @task.start
    fill_in "Student", with: @task.student_id
    fill_in "Teacher", with: @task.teacher_id
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "should destroy Task" do
    visit task_url(@task)
    click_on "Destroy this task", match: :first

    assert_text "Task was successfully destroyed"
  end
end
