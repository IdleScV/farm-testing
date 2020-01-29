class Animals
    attr_reader :name, :type, :status, :hunger

    @@all = []
    @@allalive = []
    @@allproducts = {drumsticks => 0, milk => 0}

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

    def retrieveproduct
        if self.type == 'chicken'
            @@product 
    end

end

chicken1 = Animals.new('fred', 'chicken')
chicken2 = Animals.new('creed', 'chicken')
cow1 = Animals.new('cowy', 'cow')
cow2 = Animals.new('cowwie', 'cow')

Animals.fullday
Animals.fullday
Animals.fullday
cow1.hunger=(5)
Animals.fullday
Animals.fullday
Animals.feed




p Animals.all_animals