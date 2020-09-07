class Section < ApplicationRecord
  belongs_to :teacher_subject
  belongs_to :classroom
  has_many :section_timings, dependent: :destroy

  validates :teacher_subject_id, uniqueness: { scope: :classroom_id }

  def title
    "#{classroom.title} - #{teacher_subject.title}"
  end
end
