#! = TO DO
#! Jobs... feeder, cleaner,cooks, owner
#!feeders feed animals, make them hungry by -1
#!cleaners clean,must clean once a day. makes them hungry by -1
#!cooks cook, making themselves hungry by -1, but gives everyone +2 in hunger
#!owner, calls the end of the day. hunger -1 once a day.


class People
    attr_accessor :job, 
    attr_reader :name, :hunger

    def initialize(name, job)
        @name = name
        @job = job
        @hunger = 3
    end

    def hunger=(hunger)
        if hunger > 5
            @hunger = 5
        elsif hunger < 0
            @hunger = 0
        else 
            @hunger = hunger
        end
    end








end