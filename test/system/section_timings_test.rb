require "application_system_test_case"

class SectionTimingsTest < ApplicationSystemTestCase
  setup do
    @section_timing = section_timings(:one)
  end

  test "visiting the index" do
    visit section_timings_url
    assert_selector "h1", text: "Section Timings"
  end

  test "creating a Section timing" do
    visit section_timings_url
    click_on "New Section Timing"

    fill_in "Day", with: @section_timing.day
    fill_in "End time", with: @section_timing.end_time
    fill_in "Section", with: @section_timing.section
    fill_in "Start time", with: @section_timing.start_time
    click_on "Create Section timing"

    assert_text "Section timing was successfully created"
    click_on "Back"
  end

  test "updating a Section timing" do
    visit section_timings_url
    click_on "Edit", match: :first

    fill_in "Day", with: @section_timing.day
    fill_in "End time", with: @section_timing.end_time
    fill_in "Section", with: @section_timing.section
    fill_in "Start time", with: @section_timing.start_time
    click_on "Update Section timing"

    assert_text "Section timing was successfully updated"
    click_on "Back"
  end

  test "destroying a Section timing" do
    visit section_timings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Section timing was successfully destroyed"
  end
end
