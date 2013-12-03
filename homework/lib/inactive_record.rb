require 'yaml'
module InactiveRecord
  class Base
    class << self
      def config
        yield(self) if block_given?
      end

      def schemas path=nil
        if path
          @schemas = YAML.load_file(path)
        else
          @schemas
        end
      end

      def inherited(base)
        base.class_eval do
          class << self
            attr_accessor :schema
          end
        end

        base.schema = @schemas[base.name]
      end
    end

    def initialize
      @attrs ||= {}
      yield(self) if block_given?
    end

    def method_missing(name, *args, &block)
      if @attrs.key?(name)
        @attrs[name]
      elsif name =~ /^(\w+)=$/
        attr_name = $1
        raise StandardError.new("invalid attribute #{attr_name}") unless vaild_attr?(attr_name)
        @attrs[attr_name.to_sym]= args.first
      else
        super.method_missing(name, args, &block)
      end
    end

    private
    def vaild_attr?(attr_name)
      attribute_names.include?(attr_name)
    end

    def attribute_names
      self.class.schema.map{|name, type| name.downcase}
    end

  end
end
