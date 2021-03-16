require 'test_helper'

class StudentTest < ActiveSupport::TestCase



  context "create student" do
    setup do
      create_students
    end

    teardown do
      destroy_students
    end
  end


 #relationships
 should belong_to(:organization)
 should have_many(:student_teams)
 should have_many(:teams).through(:student_teams)
#validations
should validate_presence_of(:first_name)
should validate_presence_of(:last_name)
should validate_presence_of(:grade)
should validate_presence_of(:organization_id)
should validate_inclusion_of(:grade).in_array([3,4,5,6,7,8,9,10,11,12])
should allow_value(5).for(:grade)
should_not allow_value(25).for(:grade)


should "Show that there are 3 senior teams" do
  assert_equal 3, team.senior.size
  assert_equal["CMU1","GUQ1","NUQ1","WCQ1"]= team.alphabetical.map{|f| f.name}.sort
end 

should "Show that there is 1 junior team" do
  assert_equal 1, team.junior.size
  assert_equal["CMU2"]= team.alphabetical.map{|f| f.name}.sort
end 

should "validating make_active" do
  assert @nuq.make_active
  assert_equal true, @nuq.active
end

should "validating make_inactive" do
  assert @cmu.make_inactive
  assert_equal false, @cmu.active
end
context "Creating students" do
  setup do
    create_students
  end

  teardown do
    destroy_students
  end
end

end
