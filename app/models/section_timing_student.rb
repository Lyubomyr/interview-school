class SectionTimingStudent < ApplicationRecord
  belongs_to :section_timing
  belongs_to :student

  def title
    "#{section_timing.title} - #{student.first_and_last_name}"
  end
end
