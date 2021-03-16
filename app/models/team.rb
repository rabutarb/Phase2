class Team < ApplicationRecord
  belongs_to :organization
  has_many :students, through: :student_teams
  has_many :student_teams

  validates_presence_of :name
  validates_presence_of :division
  validates_presence_of :organization_id
  validates_inclusion_of :division, in: %w['junior','senior']
  validate :organization_active


  scope :alphabetical, -> { order('name')}
  scope :active,      -> {where(active: true)}
  scope :inactive,    -> {where(active: false)}
  scope :juniors,    -> {where(division: "juniors")}
  scope :seniors,    -> {where(division: "seniors")}
  scope :for_organization,    -> (organization) {where('organization = ?', organization)}


  def make_active
      self.update_attribute(:active, true)
  end

  def make_inactive
      self.update_attribute(:active, false)
  end

  def organization_active
    org = Organization.active.all.map{|o| o.organization_id}
    
    unless org.include?(self.organization_id)
        errors.add(:organization, "it is not an already active organization in Teams")
    end
end
end
