class Student < ApplicationRecord
  has_many :section_timing_students, dependent: :destroy
  has_many :section_timings, through: :section_timing_students

  validates :nickname, :first_name, :last_name, presence: true

  def first_and_last_name
    "#{first_name} #{last_name}"
  end
end
