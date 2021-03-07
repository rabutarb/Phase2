class Team < ApplicationRecord
  belongs_to :organization_id
  has_many :students, through :student_teams
end
