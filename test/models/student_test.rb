require 'test_helper'

class StudentTest < ActiveSupport::TestCase
 #relationships
 should belong_to(:organization)
 should have_many(:student_teams)
 should have_many(:teams).through(:student_teams)
#validations
should validate_presence_of(:first_name)
should validate_presence_of(:last_name)
should validate_presence_of(:grade)
should validate_presence_of(:organization_id)




context "Creating students" do
  setup do
    create_students
  end

  teardown do
    destroy_students
  end

#scopes
# should "have a scope to alphabetize tasks" do
#   assert_equal ["Mow grass", "Shovel driveway", "Stack wood", "Sweep floor", "Wash dishes"], Task.alphabetical.map{|t| t.name}
# end

# should "have a scope to select only active tasks" do
#   assert_equal ["Mow grass", "Shovel driveway", "Sweep floor", "Wash dishes"], Task.active.alphabetical.map{|t| t.name}
# end


end
