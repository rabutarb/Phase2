class CreateStudentTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :student_teams do |t|
      t.integer :id
      t.references :team_id, foreign_key: true
      t.references :student_id, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :position
      t.boolean :active

      t.timestamps
    end
  end
end
