require 'test_helper'
require 'simplecov'
SimpleCov.start 'rails'
class TeamTest < ActiveSupport::TestCase
  #matchers 

  #context
  context "this context" do
    setup do
      create_teams
    end

    teardown do
      destroy_teams
    end
  end
  #relationships testing
  should have_many(:students).through(:student_teams)
  should belong_to(:organization_id)

  #validations testing
  should validate_presence_of(:name)
  should validate_presence_of(:division)
  should validate_presence_of(:organization_id)
  should validate_inclusion_of(:division).in_array(['junior','senior')
  
end
