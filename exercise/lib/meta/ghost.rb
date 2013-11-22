class Ghost
    def method_missing(name, *args)
        if name.to_s =~ /awesome/
            puts "#{name} was called with arguments, #{args.join(',')}"
        else
            super
        end
    end
end

ghost = Ghost.new

ghost.awesome_method("one", "two", "three")
# ghost.method_not_exist("one", "two", "three")

class Magic
    def method_missing(name, *args, &block)
        eigenclass = class << self; self; end
        eigenclass.class_eval do
            define_method "#{name}" do |*args, &block|
                block.call(self) if block_given?
            end
        end
        send(name, *args, &block)
    end
end

# 
magic = Magic.new
magic.person do |p|
    puts p.class
end

class Person
    def name
        puts "person.name is invoked"
    end
end

person = Person.new
person.name

# singlaton method
def person.address
    puts "Greenland"
end

person.address

# open class Class, and add another method
# class Class
#     def loud_name
#         puts "#{name.upcase}"
#     end
# end

Class.class_eval do
    def loud_name
        puts "#{name.upcase}"
    end
end

Person.loud_name

class Person
    def name
        puts "person.name is invoked"
    end
end

PPerson = Class.new do
    def name
        puts "person.name is invoked"
    end
end

PPerson.new.name
