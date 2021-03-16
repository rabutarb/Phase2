class Student < ApplicationRecord
  #relationships
  belongs_to :organization
  has_many :student_teams
  has_many :teams, through: :student_teams
  #validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :grade
  validates_presence_of :organization_id
  validates_inclusion_of :grade, :in => 3..12
  validate :organization_active

  #scopes
  scope :alphabetical, -> { order('last_name','first_name') }
  scope :active, -> {where(active: true)}  
  scope :inactive, -> {where(active: false)}  
  scope :junior, -> {where("grade <?",9)}
  scope :senior, -> {where("grade >=?",9)}

  #methods
  def make_active
      self.update_attribute(:active, true)
  end

  def make_inactive
      self.update_attribute(:active, false)
  end


  def junior?
    a=[3,4,5,6]
    if a.include?[@grade]
      return true
    else 
      return false  
  end
#current team

  def name 
    "#{last_name}, #{first_name}"
  end

  def proper_name
    "#{first_name} #{last_name}"
  end

  def organization_active
    org = Organization.active.all.map{|o| o.organization_id}
    
    unless org.include?(self.organization_id)
        errors.add(:organization, "it is not an already active organization in Teams")
    end
  end




end
