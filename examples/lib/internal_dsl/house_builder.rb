module HouseBuilder
  def self.build(name, &block)
    house = House.new(name)
    house.instance_eval(&block)
    house
  end

  class House
    attr_reader :name, :floors
    def initialize(name)
      @name = name
      @floors = []
    end

    def floor(number, &block)
      fl = Floor.new(number)
      fl.instance_eval(&block)
      @floors << fl
    end

  end

  class Floor
    attr_accessor :number, :rooms

    def initialize(number = 0)
      @number = number
      @rooms = []
    end

    def room(type)
      @rooms << Room.new(type)
    end
  end

  class Room
    attr_reader :type

    def initialize(type)
      @type = type
    end
  end

end
