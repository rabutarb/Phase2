require 'test_helper'

class StudentTeamTest < ActiveSupport::TestCase

    context "create student team" do
        setup do
          create_student_teams
        end
    
        teardown do
          destroy_student_teams
        end
      end
    
    
#relationships

#validations
should validate_presence_of(:start_date)
should validate_presence_of(:position)
should validate_presence_of(:student_id)
should validate_presence_of(:team_id)
should validate_inclusion_of(:position).in_array([1,2,3,4,5])

#scopes

#methods
should "validating make_active" do
  assert @nuq.make_active
  assert_equal true, @nuq.active
end

should "validating make_inactive" do
  assert @cmu.make_inactive
  assert_equal false, @cmu.active
end
end
