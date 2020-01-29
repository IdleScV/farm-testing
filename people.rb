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