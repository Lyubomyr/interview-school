require 'test_helper'

class SectionTimingStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section_timing_student = section_timing_students(:one)
  end

  test "should get index" do
    get section_timing_students_url
    assert_response :success
  end

  test "should get new" do
    get new_section_timing_student_url
    assert_response :success
  end

  test "should create section_timing_student" do
    assert_difference('SectionTimingStudent.count') do
      post section_timing_students_url, params: { section_timing_student: { section_timing_id: @section_timing_student.section_timing_id, student_id: @section_timing_student.student_id } }
    end

    assert_redirected_to section_timing_student_url(SectionTimingStudent.last)
  end

  test "should show section_timing_student" do
    get section_timing_student_url(@section_timing_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_section_timing_student_url(@section_timing_student)
    assert_response :success
  end

  test "should update section_timing_student" do
    patch section_timing_student_url(@section_timing_student), params: { section_timing_student: { section_timing_id: @section_timing_student.section_timing_id, student_id: @section_timing_student.student_id } }
    assert_redirected_to section_timing_student_url(@section_timing_student)
  end

  test "should destroy section_timing_student" do
    assert_difference('SectionTimingStudent.count', -1) do
      delete section_timing_student_url(@section_timing_student)
    end

    assert_redirected_to section_timing_students_url
  end
end
