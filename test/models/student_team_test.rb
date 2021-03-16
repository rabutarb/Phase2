require 'test_helper'

class StudentTeamTest < ActiveSupport::TestCase
#relationships

#validations
should validate_presence_of(:start_date)
should validate_presence_of(:position)
should validate_presence_of(:student_id)
should validate_presence_of(:team_id)
should validate_inclusion_of(:position).in_array([1,2,3,4,5])

#scopes

#methods

end
