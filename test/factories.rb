FactoryBot.define do
  
    # TODO: fill in factory blueprint for Organization
    factory :organization do
        name {"Carnegie Mellon"}
        street_1 {"QF"}
        street_2 {"EC"}
        city {"Doha"}
        state {"Pennsylvania"}
        zip {"15106"}
        short_name {"cmu"}
        active {true}
    end
  
    # factory blueprint for team
    factory :team do
        name {"CMU1"}
        association :organization
        division {"senior"}
        active {true}
    end
  
    # factory blueprint for student
    factory :student do
      first_name {"Rahaf"}
      last_name {"Khaled"}
      grade {12}
      active{true}
      association :organization
    end

    # factory blueprint for student teams
    factory :student_teams do
        start_date{3.days.ago.to_date}
        end_date{nil}
        association :team
        association :student
        position {1}
        active{true}
      end
  end