class StudentTeam < ApplicationRecord
  #relationships
  belongs_to :team
  belongs_to :student
  has_many :students
#validations
validates_presence_of :start_date
validates_presence_of :position
validates_presence_of :student_id
validates_presence_of :team_id
validates_inclusion_of :position, in: %w[1,2,3,4,5]
#scopes
scope :alphabetical, -> { order('last_name','first_name') }
scope :active, -> {where(active: true)}  
scope :inactive, -> {where(active: false)}  
scope :by_position, -> { order('position') }
scope :chronological, -> { order('start_date') }
scope :captains, -> {where(position: 1)}


#methods
def make_active
  self.update_attribute(:active, true)
end

def make_inactive
  self.update_attribute(:active, false)
end


end
