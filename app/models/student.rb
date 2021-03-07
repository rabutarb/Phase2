class Student < ApplicationRecord
  belongs_to :organization_id
  has_many :teams, through :student_teams
end
