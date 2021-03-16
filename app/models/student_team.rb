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
validate :student_active
validate :team_active

#scopes
scope :alphabetical, -> { order('last_name','first_name') }
scope :active, -> {where(active: true)}  
scope :inactive, -> {where(active: false)}  
scope :by_position, -> { order('position') }
scope :chronological, -> { order('start_date') }
scope :captains, -> {where(position: 1)}
scope :current, -> {where("start_date >= ?", Date.current.to_date)}
scope :past, -> {where("end_date < ?", Date.current.to_date)}
scope :for_student, ->(student) {where ("student_id = ?" student)}
scope :for_team, ->(team) {where ("team_id = ?" team)}

#methods
def make_active
  self.update_attribute(:active, true)
end

def make_inactive
  self.update_attribute(:active, false)
end

def student_active
  stu = Student.active.all.map{|s| s.student_id}
  
  unless stu.include?(self.student_id)
      errors.add(:student, "it is not an already active student")
  end
end


def team_active
  tea = Team.active.all.map{|t| t.team_id}
  
  unless tea.include?(self.team_id)
      errors.add(:team, "it is not an already active team")
  end
end



#end_previous_team_assignment
end
