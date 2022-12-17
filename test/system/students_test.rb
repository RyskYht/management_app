require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "should create student" do
    visit students_url
    click_on "New student"

    fill_in "Admission date", with: @student.admission_date
    fill_in "Birthday", with: @student.birthday
    fill_in "Email", with: @student.email
    fill_in "Expulsion date", with: @student.expulsion_date
    fill_in "Family", with: @student.family_id
    fill_in "Grade", with: @student.grade
    fill_in "Login", with: @student.login_id
    fill_in "Memo", with: @student.memo
    fill_in "Name", with: @student.name
    fill_in "Password digest", with: @student.password_digest
    fill_in "School", with: @student.school_id
    fill_in "School name", with: @student.school_name
    fill_in "Tel", with: @student.tel
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "should update Student" do
    visit student_url(@student)
    click_on "Edit this student", match: :first

    fill_in "Admission date", with: @student.admission_date
    fill_in "Birthday", with: @student.birthday
    fill_in "Email", with: @student.email
    fill_in "Expulsion date", with: @student.expulsion_date
    fill_in "Family", with: @student.family_id
    fill_in "Grade", with: @student.grade
    fill_in "Login", with: @student.login_id
    fill_in "Memo", with: @student.memo
    fill_in "Name", with: @student.name
    fill_in "Password digest", with: @student.password_digest
    fill_in "School", with: @student.school_id
    fill_in "School name", with: @student.school_name
    fill_in "Tel", with: @student.tel
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "should destroy Student" do
    visit student_url(@student)
    click_on "Destroy this student", match: :first

    assert_text "Student was successfully destroyed"
  end
end
