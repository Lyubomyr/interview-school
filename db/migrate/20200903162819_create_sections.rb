class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.references :teacher_subject, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
    add_index :sections, [:teacher_subject_id, :classroom_id], unique: true
  end
end
