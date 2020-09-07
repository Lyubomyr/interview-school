require "application_system_test_case"

class SectionTimingStudentsTest < ApplicationSystemTestCase
  setup do
    @section_timing_student = section_timing_students(:one)
  end

  test "visiting the index" do
    visit section_timing_students_url
    assert_selector "h1", text: "Section Timing Students"
  end

  test "creating a Section timing student" do
    visit section_timing_students_url
    click_on "New Section Timing Student"

    fill_in "Section timing", with: @section_timing_student.section_timing_id
    fill_in "Student", with: @section_timing_student.student_id
    click_on "Create Section timing student"

    assert_text "Section timing student was successfully created"
    click_on "Back"
  end

  test "updating a Section timing student" do
    visit section_timing_students_url
    click_on "Edit", match: :first

    fill_in "Section timing", with: @section_timing_student.section_timing_id
    fill_in "Student", with: @section_timing_student.student_id
    click_on "Update Section timing student"

    assert_text "Section timing student was successfully updated"
    click_on "Back"
  end

  test "destroying a Section timing student" do
    visit section_timing_students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Section timing student was successfully destroyed"
  end
end
