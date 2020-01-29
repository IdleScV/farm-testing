#? Animals start with 5 hunger
#? Everyday they lose 1 hunger
#? Feeding provides 1 hunger
#? Animals with hunger of 0 get killed
#? retrieve product kills chickens & make cows hungry. 
#? Cows give milk +1 chickens
#? Creates array of all alive animals
#


class Animals
    attr_reader :name, :type, :hunger
    attr_accessor :status
    @@all = []
    @@allalive = []
    @@allproducts = {:drumsticks => 0, :milk => 0}

    def initialize(name, type)
        @type = type
        @name = name
        @status = "alive"
        @hunger = 5
        @@all << self
        @@allalive << self
    end

    def hunger=(hunger)
        if hunger > 5
            @hunger = 5
        elsif hunger <= 0
            @hunger = 0
            @status = "dead"
            @@allalive.delete(self)
        else 
            @hunger = hunger
        end
    end

    def self.all_animals
        @@all
    end
    
    def self.fullday
        @@all.map{|x| x.hunger=(x.hunger - 1)}
    end

    def self.feed
        @@allalive.map{|x| x.hunger=(x.hunger + 1)}
    end

    #! This method adds food into @@allproducts, kills chickens
    def retrieveproduct
        #! not working
        if self.type == 'chicken' && self.status == 'alive'
            @@allproducts[:drumsticks] += 2
            self.status = "became food"
            @@allalive.delete(self)

            #! Cow works
        elsif self.type == 'cow' && self.status == "alive"
            @@allproducts[:milk] += 1
            self.hunger -= 2
        end

    end

    def self.allproducts
        @@allproducts
    end

    def self.allalive
        @@allalive
    end
end

# chicken1 = Animals.new('fred', 'chicken')

# cow1 = Animals.new('cowy', 'cow')

# chicken1.retrieveproduct
# chicken1.retrieveproduct

# cow1.retrieveproduct
# cow1.retrieveproduct
# cow1.retrieveproduct
# cow1.retrieveproduct
# cow1.retrieveproduct




# p Animals.all_animals.map{|animal| animal.name}
# p Animals.allproducts
# p Animals.allalive{|animal| animal.name}
