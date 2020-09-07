class SectionTiming < ApplicationRecord
  TIME_RANGE_MINUTES = (450..1320)
  DURATIONS_MINUTES = [50, 80]
  AVAILABLE_HOURS = (1..12).to_a.map{|v| v < 10 ? "0#{v}" : "#{v}"}
  AVAILABLE_MINUTES = (0..50).step(10).to_a.map{|v| v < 10 ? "0#{v}" : "#{v}"}

  attr_accessor :start_time_hours, :start_time_minutes, :start_time_am_pm, :end_time_hours, :end_time_minutes, :end_time_am_pm

  enum day: {Mon: 1, Tue: 2, Wed: 3, Thu: 4, Fri: 5}

  belongs_to :section
  has_many :sections_timing_students, dependent: :destroy
  has_many :students, through: :sections_timing_students

  validates :day, :start_time, :end_time, presence: true
  validate :time_is_valid

  scope :order_by_time, -> { order(:day, :start_time) }

  before_validation :join_times

  ['start_time', 'end_time'].each do |field|
    ['to_a', 'to_s'].each do |method|
      define_method("#{field}_#{method}") { self.send("time_#{method}", self.send(field)) }
    end
  end

  def title
    "#{section.title} - #{day} - #{start_time_to_s} - #{end_time_to_s}"
  end

  private

  def time_is_valid
    puts (end_time - start_time).class
    puts DURATIONS_MINUTES
    errors.add(:start_time, "classes should be between 07:30 AM and 10:00 PM") unless TIME_RANGE_MINUTES === start_time
    errors.add(:end_time, "classes should be between 07:30 AM and 10:00 PM") unless TIME_RANGE_MINUTES === end_time

    errors.add(:base, "End time should be greater than Start time") unless start_time < end_time

    errors.add(:base, "Classes should be 50 or 80 minutes long") unless DURATIONS_MINUTES.include?(end_time - start_time)
  end

  def join_times
    self.start_time = time_to_i start_time_hours.to_i, start_time_minutes.to_i, start_time_am_pm
    self.end_time = time_to_i end_time_hours.to_i, end_time_minutes.to_i, end_time_am_pm
  end

   def time_to_i(h, m, am_pm)
    h += 12 if am_pm == 'PM' && h < 12
    h * 60 + m
  end

  def time_to_a(time)
    h = time / 60
    m = time % 60

    am_pm = h < 12 ? 'AM' : 'PM'
    h -= 12 if h > 12

    [h, m, am_pm]
  end

  def time_to_s(time)
    time_a = time_to_a time

    "#{time_a[0] < 10 ? '0' : ''}#{time_a[0]}:#{time_a[1]} #{time_a[2]}"
  end
end
