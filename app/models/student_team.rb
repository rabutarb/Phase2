class StudentTeam < ApplicationRecord
  belongs_to :team_id
  belongs_to :student_id
  has_many :students
end
