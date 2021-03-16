require 'test_helper'
require 'simplecov'
SimpleCov.start 'rails'
class TeamTest < ActiveSupport::TestCase

  context "create team" do
    setup do
      create_teams
    end

    teardown do
      destroy_teams
    end
  end



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
    should "Show that there are 2 inactive teams" do
      assert_equal 2, team.inactive.size
      assert_equal["NUQ1","WCQ1"]= team.alphabetical.map{|f| f.name}.sort
    end 

    should "Show that there are 3 senior teams" do
      assert_equal 3, team.senior.size
      assert_equal["CMU1","GUQ1","NUQ1","WCQ1"]= team.alphabetical.map{|f| f.name}.sort
    end 

    should "Show that there is 1 junior team" do
      assert_equal 1, team.junior.size
      assert_equal["CMU2"]= team.alphabetical.map{|f| f.name}.sort
    end 

    should "have a scope for_organization that works" do
      assert_equal 2, Team.for_organization(@cmu.id).size
      assert_equal 1, Team.for_organization(@guq.id).size
    end    
    should "validating make_active" do
      assert @nuq.make_active
      assert_equal true, @nuq.active
    end
  
    should "validating make_inactive" do
      assert @cmu.make_inactive
      assert_equal false, @cmu.active
    end
    #testing organization_active
    should "identify a team with not active org as invalid" do
      team55 = FactoryBot.build(:team, name: "nuq8",active:false)
      deny team55.organization_active?
    end
  end
end
