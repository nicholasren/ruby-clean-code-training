module MyModule
    def self.included(base)
        base.extend(ClassMethods)
    end

    module ClassMethods
        define_method :macro do |*names|
            names.each do |name|
                puts "ok, ok, #{name}"
            end
        end
    end
end

class MyClass
    include MyModule
    puts "what? an string before a class definition"

    # def self.macro(*names)
    #     names.each do |name|
    #         puts "ok, ok, #{name}"
    #     end
    # end

    # macro :hello, :world
    def method 
        puts "in a method"
    end

    puts "what? an string after a class definition"
end

