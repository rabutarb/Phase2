require 'test_helper'
require 'simplecov'
SimpleCov.start 'rails'
class OrganizationTest < ActiveSupport::TestCase

  #context
  context "this context" do
    setup do
      create_organizations
    end

    teardown do
      destroy_organizations
    end
  end

  #matchers
  #relationship testing
  should have_many(:students)
  should have_many(:teams)

  #validations
  should validate_presence_of(:name)
  should validate_presence_of(:street_1)
  should validate_presence_of(:zip)
  should validate_presence_of(:short_name)

  should validate_inclusion_of(:state).in_array(["Alabama", "Alaska", "Arizona", "Arkansas", "California",
  "Colorado", 
  "Connecticut" ,
  "Delaware",
  "Florida", 
  "Georgia", 
  "Hawaii",
  "Idaho", 
  "Illinois", 
  "Indiana", 
  "Iowa", 
  "Kansas", 
  "Kentucky", 
  "Louisiana", 
  "Maine", 
  "Maryland", 
  "Massachusetts", 
  "Michigan", 
  "Minnesota", 
  "Mississippi", 
  "Missouri", 
  "Montana", 
  "Nebraska", 
  "Nevada", 
  "New Hampshire", 
  "New Jersey",
  "New Mexico", 
  "New York", 
  "North Carolina", 
  "North Dakota",
  "Ohio", 
  "Oklahoma", 
  "Oregon", 
  "Pennsylvania", 
  "Rhode Island", 
  "South Carolina", 
  "South Dakota", 
  "Tennessee", 
  "Texas", 
  "Utah", 
  "Vermont",
  "Virginia", 
  "Washington", 
  "West Virginia", 
  "Wisconsin", 
  "Wyoming"])
  should validate_uniqueness_of(:short_name)
  # should validate_format_of(:zip).with(/\A\d{5}\z/)

  should allow_value("Texas").for(:state)
  should_not allow_value("Doha").for(:state)

  should_not allow_value(nil).for(:name)
  should_not allow_value(nil).for(:zip)
  should_not allow_value(nil).for(:street_1)
  should_not allow_value(nil).for(:short_name)
  should_not allow_value(10).for(:zip)
  should allow_value("17362").for(:zip)

  #testing scopes
  should "Show organizations in alphabetical order" do
    assert_equal["cmu","guq","nuq"]= organization.alphabetical.map{|f| f.short_name}.sort
  end
  should "Show that there are 2 active organizations" do
    assert_equal 2, organization.active.size
    assert_equal["cmu","guq"]= organization.alphabetical.map{|f| f.short_name}.sort
  end 

  
end
