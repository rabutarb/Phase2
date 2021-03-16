class Organization < ApplicationRecord
    has_many :students
    has_many :teams
    validates_presence_of :name
    validates_presence_of :street_1
    validates_presence_of :zip
    validates_presence_of :short_name 
    validates_uniqueness_of :short_name
    validates_format_of :zip, with: /\A\d{5}\z/
    validates_inclusion_of :state, in: %w["Alabama", "Alaska", "Arizona", "Arkansas", "California",
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
    "Wyoming"]
    scope :alphabetical, -> { order('name')}
    scope :active,      -> {where(active: true)}
    scope :inactive,    -> {where(active: false)}
    

    def make_active
        self.update_attribute(:active, true)
    end

    def make_inactive
        self.update_attribute(:active, false)
    end

end
