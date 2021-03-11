class Team < ApplicationRecord
  belongs_to :organization_id
  has_many :students, through :student_teams

  validates_presence_of :name
  validates_presence_of :division
  validates_presence_of :organization_id
  validates_inclusion_of :division, in : %w['junior','senior']


  scope :alphabetical, -> { order('name')}
  scope :active,      -> {where(active: true)}
  scope :inactive,    -> {where(active: false)}
  scope :juniors,    -> {where(division: "juniors")}
  scope :seniors,    -> {where(division: "seniors")}
  scope :for_organization,    -> (organization) {where('organization = ?', organization)}


  private
  def make_active
      self.update_attribute(:active, true)
  end

  def make_inactive
      self.update_attribute(:active, false)
  end
end
