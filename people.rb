require 'pry'
class People
    #//                                     
    #! Below is presets

    attr_accessor :job
    attr_reader :name

    @@all = []
    @@jobs = {:owner => [], :farmhands => [], :farmers => [], :cooks =>[], :nojob => []}

    #! Above is presets
    #//                                     
    #! Below is all for adding new people

    def sortjob(jobtype)
        # binding.pry
        case jobtype
            # binding.pry
            when 'cooks'
                then @@jobs[:cooks].push self
            when 'farmhands'
                then @@jobs[:farmhands].push self
            when 'farmers'
                then @@jobs[:farmers].push self
            when 'owner'
                then @@jobs[:owner].push self
            when 'nojob'
                then @@jobs[:nojob].push self
        end
    end
    
    def initialize(name, job='nojob')
        @name = name
        @job = job
        @hunger = 5
        @@all << self
        sortjob(@job)
    end

    #! Above is all for adding new people
    #//                                     
    #! Below is all for multiple persons

    def self.all
        @@all
    end

    def self.jobs(type='all')
        case type
            when 'all'
                @@jobs.map{|k, v| v.map{|person| "#{person.job}: #{person.name} at #{person.hunger} hunger level."}}
            when 'cooks'
                @@jobs[:cooks].map{|person| "#{person.name} at #{person.hunger} hunger level."}
            when 'farmhands'
                @@jobs[:farmhands].map{|person| "#{person.name} at #{person.hunger} hunger level."}
            when 'farmers'
                @@jobs[:farmhands].map{|person| "#{person.name} at #{person.hunger} hunger level."}
            when 'owner'
                @@jobs[:owner].map{|person| "#{person.name} at #{person.hunger} hunger level."}
            when 'unemployeed'
                @@jobs[:nojob].map{|person| "#{person.name} at #{person.hunger} hunger level."}
            end
    end

    #! Above is all for multiple persons
    #//                                         
    #! Bellow is all for one person

    #! INFO
    def person_info
        "#{@name} is a #{@job} and their hunger is at #{@hunger}"
    end
    #! HUNGER
    def hunger
        @hunger > 0 ? "#{@name} is at #{@hunger} hunger level." : "#{@name} needs to eat"
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
    #? eat increase 4 hunger
    def eat
        self.hunger(self.hunger + 2)
    end

    #! WORK
    def can_work?
        @hunger > 0
    end

    def work
        self.can_work? ? self.hunger=(@hunger - 1) : "Too hungry to work"
    end


end

#! List of test people
owner = People.new('Alessio Curran', 'owner')
cook1 = People.new('Ricardo Salgado', 'cooks')
cook2 = People.new('Lois Nixon', 'cooks')
farmhand1 = People.new('Anaya Mcmanus', 'farmhands')
farmhand2 = People.new('Rohit Barrera', 'farmhands')
farmhand3 = People.new('Eesha Greenaway', 'farmhands')
farmer1 = People.new('Jena Humphreys', 'farmers')
farmer2 = People.new('Demi-Lee Rollins', 'farmers')
nojob1 = People.new('Nathan Lewis')


#! test functioning
#? multiple people info test
# puts People.all
# puts People.jobs
# p People.jobs('owner')
# p People.jobs('cooks')
# p People.jobs('farmhands')

#? singular info test
# p owner.job
# p owner.person_info

#? Hunger + work test
p cook1.hunger
p cook1.work
p cook1.hunger
p cook1.work
p cook1.hunger
p cook1.work
p cook1.hunger
p cook1.work
p cook1.hunger
p cook1.work
p cook1.hunger
p cook1.work
p cook1.hunger


#? in Farm, make a method of newPerson(name, job title) that calls People.new(job ,title)



