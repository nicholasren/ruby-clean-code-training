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
    puts "what? an string inside a class"

    # def self.macro(*names)
    #     names.each do |name|
    #         puts "ok, ok, #{name}"
    #     end
    # end

    macro :hello, :world
end
