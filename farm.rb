# require_relative './animals.rb'
require 'pry'
require_relative './people.rb'

class Farm 

    attr_reader :name

    @@farms = []

    def initialize(farm_name_string, owner_name_string)
        @name = farm_name_string
        @day = 0
        People.new(owner_name_string , "owner" , self)
        @@farms << self
    end

    #! Above is for adding new farm
    #//                                     
    #! Below is multiple farm methods
    
    def self.all
        @@farms
    end

    #? Returns the arry of people that are on the farm

    #? Returns the arry animals that are on the farm



    #! Above is multiple farm methods
    #//                                     
    #! Below is single farm methods
    def day
        @day
    end


    #! Above is single farm methods
    #//                                     
    #! Below is relationship with people.rb methods
    #? returns list of people in the farm
    def people
        People.all.select {|person| person.farm == self} #.map{|people| people.job + ", " +people.hunger}
    end

    #? add new person to the farm
    def new_person(person_name_string, job_string)
        People.new(person_name_string, job_string, self)
    end



end

daily = Farm.new("Daily Farms", "Bob")
daily.new_person("Clide", "cooks" )
crusty = Farm.new("Crusty Farms", "Craig")
p daily.people
p daily.day
