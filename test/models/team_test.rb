require 'test_helper'
require 'simplecov'
SimpleCov.start 'rails'
class TeamTest < ActiveSupport::TestCase

  #matchers
  #relationships testing
  should have_many(:students).through(:student_teams)
  should have_many(:student_teams)
  should belong_to(:organization_id)

  #validations testing
  should validate_presence_of(:name)
  should validate_presence_of(:division)
  should validate_presence_of(:organization_id)
  should validate_inclusion_of(:division).in_array(['junior','senior'])

  #context
  context "create teams" do
    setup do
      create_teams
    end

    teardown do
      destroy_teams
    end
  
  should allow_value("junior").for(:division)
  should allow_value("senior").for(:division)
  should_not allow_value("freshman").for(:division)
  should_not allow_value("sophomore").for(:division)
  should_not allow_value(nil).for(:name)
  should_not allow_value(nil).for(:division)

  #scopes testing
    should "Show teams in alphabetical order" do
      assert_equal["CMU1","GUQ1","NUQ1"]= team.alphabetical.map{|f| f.name}.sort
    end
    should "Show that there are 2 active teams" do
      assert_equal 2, team.active.size
      assert_equal["CMU1","GUQ1"]= team.alphabetical.map{|f| f.name}.sort
    end 

  end
end
