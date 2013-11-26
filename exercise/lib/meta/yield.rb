def math(a, b)
    yield(a, b)
end

# p math(1, 2) {|a, b| a + b}
# p math(1, 2) {|a, b| a - b}
# p math(1, 2) {|a, b| a * b}
# p math(1, 2) {|a, b| a / b}

class Person
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def do_with_name
        yield @name
    end
end

# juntao = Person.new("juntao")
# juntao.do_with_name do |name|
#     puts name.upcase
# end
# 
# juntao.do_with_name do |name|
#     name.to_s
# end
# 
# p juntao.name
