class Dog
    def bark
        puts "bark bark"
    end
end

wang = Dog.new
wo = Dog.new

def wang.pee
    puts "headstand"
end

wang.pee

class << wo
    def pee
        puts "handstand"
    end
end

wo.pee

class << Dog
    def closet_relative
        puts "wolf"
    end
end

Dog.closet_relative
p Dog.class

class Dog
    def eigenclass
        class << self
            self
        end
    end
end

p Dog.class

tiger = Dog.new
p tiger.eigenclass
p tiger.eigenclass.superclass

class Mammal
    def self.warm_blooded?
        puts true
    end
end

class Dog < Mammal
    def self.closet_relative
        puts "wolf"
    end
end

Dog.closet_relative
Dog.warm_blooded?
