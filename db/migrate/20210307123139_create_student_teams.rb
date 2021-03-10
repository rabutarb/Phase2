class CreateStudentTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :student_teams do |t|
      t.integer :studentTeams_id
      t.references :team_id, foreign_key: true
      t.references :student_id, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :position
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
