require 'test_helper'

class SectionTimingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section_timing = section_timings(:one)
  end

  test "should get index" do
    get section_timings_url
    assert_response :success
  end

  test "should get new" do
    get new_section_timing_url
    assert_response :success
  end

  test "should create section_timing" do
    assert_difference('SectionTiming.count') do
      post section_timings_url, params: { section_timing: { day: @section_timing.day, end_time: @section_timing.end_time, section: @section_timing.section, start_time: @section_timing.start_time } }
    end

    assert_redirected_to section_timing_url(SectionTiming.last)
  end

  test "should show section_timing" do
    get section_timing_url(@section_timing)
    assert_response :success
  end

  test "should get edit" do
    get edit_section_timing_url(@section_timing)
    assert_response :success
  end

  test "should update section_timing" do
    patch section_timing_url(@section_timing), params: { section_timing: { day: @section_timing.day, end_time: @section_timing.end_time, section: @section_timing.section, start_time: @section_timing.start_time } }
    assert_redirected_to section_timing_url(@section_timing)
  end

  test "should destroy section_timing" do
    assert_difference('SectionTiming.count', -1) do
      delete section_timing_url(@section_timing)
    end

    assert_redirected_to section_timings_url
  end
end
