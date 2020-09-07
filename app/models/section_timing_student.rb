class SectionTimingStudent < ApplicationRecord
  belongs_to :section_timing
  belongs_to :student

  validate :check_overlays

  def title
    "#{section_timing.title} - #{student.first_and_last_name}"
  end

  private

  def check_overlays
    overlays = student.section_timings.where("day == :day and ((start_time < :start_time and end_time > :start_time) or (start_time < :end_time and end_time > :end_time))", day: SectionTiming.days[section_timing.day], start_time: section_timing.start_time, end_time: section_timing.end_time)
    errors.add(:base, "You can't attend this class, because you have overlays with: #{overlays.map(&:title).join(', ')}") if overlays.present?
  end
end
