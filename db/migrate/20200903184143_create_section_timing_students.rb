class CreateSectionTimingStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :section_timing_students do |t|
      t.references :section_timing, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
