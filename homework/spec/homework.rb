require 'rspec/core'

module Homework
  class Test
    include RSpec
    class << self
      def inherited(subclass)
        subclasses << subclass
      end

      def subclasses
        @subclasses ||= []
      end
    end
  end

  class ThePath
    def walk
      each_step do |step|
      end
    end

    def each_step
      Homework::Test.subclasses.each_with_index do |koan,koan_index|
        RSpec::Core::Runner.autorun
      end
    end

  end
end

END {
  Homework::ThePath.new.walk
}
