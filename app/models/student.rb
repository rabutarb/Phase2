class Student < ApplicationRecord
  #relationships
  belongs_to :organization
  has_many :student_teams
  has_many :teams, through :student_teams
  #validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :grade
  validates_presence_of :organization_id
  #scopes
  scope :alphabetical, -> { order('last_name','first_name') }
  scope :active, -> {where(active: true)}  
  scope :inactive, -> {where(active: false)}  
  scope :junior, -> {where(grade: 3)}
  scope :senior, -> {where(grade: 4)}
  #methods
  def make_active
      self.update_attribute(:active, true)
  end

  def make_inactive
      self.update_attribute(:active, false)
  end

  def junior?
    if @grade == 3
      return true
    else 
      return false  
  end

  def name
    return last_name + " " + first_name
  end
  
  def proper_name
    return first_name + " " + last_name
  end






  



end
