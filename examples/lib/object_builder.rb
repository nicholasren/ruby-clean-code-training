require 'jsonpath'

class ObjectBuilder
  class Rule
    attr_reader :json_path, :field_name, :converter
    def initialize json_path, field_name, converter
      @json_path = json_path
      @field_name = field_name
      @converter = converter
    end

    def apply(obj, json)
      value = JsonPath.new(@json_path).on(json)
      unless value.nil?
        obj.send("#{@field_name}=", @converter.call(value))
      end
    end
  end

  class << self
    def config
      builder = ObjectBuilder.new
      yield(builder) if block_given?
      builder
    end
  end

  def initialize
    @rules ||= []
  end

  def obj_class clazz
    @obj_clazz = clazz
  end

  def rule json_path, field_name, converter= ->(xs){xs.first}
    @rules << Rule.new(json_path, field_name, converter)
  end

  def build json
    obj = @obj_clazz.new
    @rules.each do |rule|
      rule.apply(obj, json)
    end
    obj
  end
end
