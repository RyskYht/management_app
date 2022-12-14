require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference("Student.count") do
      post students_url, params: { student: { admission_date: @student.admission_date, birthday: @student.birthday, email: @student.email, expulsion_date: @student.expulsion_date, family_id: @student.family_id, grade: @student.grade, login_id: @student.login_id, memo: @student.memo, name: @student.name, password_digest: @student.password_digest, school_id: @student.school_id, school_name: @student.school_name, tel: @student.tel } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { admission_date: @student.admission_date, birthday: @student.birthday, email: @student.email, expulsion_date: @student.expulsion_date, family_id: @student.family_id, grade: @student.grade, login_id: @student.login_id, memo: @student.memo, name: @student.name, password_digest: @student.password_digest, school_id: @student.school_id, school_name: @student.school_name, tel: @student.tel } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference("Student.count", -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
