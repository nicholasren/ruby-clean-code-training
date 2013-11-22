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
                block.call(args) if block_given?
            end
        end
        send(name, *args, &block)
    end
end

# 
missing = Magic.new
missing.person ["juntao", "nicolas"] do |p|
    puts p
end

class Person
    def name 
        "person"
    end
end

class Person
    def name
        puts "person.name is invoked"
    end
end

Person.class
person = Person.new
person.name

class Class
    def loud_name
        "#{name.upcase}"
    end
end

p Person.loud_name

