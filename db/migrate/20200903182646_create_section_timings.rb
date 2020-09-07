class CreateSectionTimings < ActiveRecord::Migration[6.0]
  def change
    create_table :section_timings do |t|
      t.references :section, foreign_key: true, null: false
      t.integer :day, null: false
      t.integer :start_time, null: false
      t.integer :end_time, null: false

      t.timestamps
    end
  end
end
