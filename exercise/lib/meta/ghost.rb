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
ghost.method_not_exist("one", "two", "three")
