require "minitest/sub_test_case/version"
require "minitest"

module Minitest
  module SubTestCase
    def sub_test_case(name, &block)
      parent_test_case = self
      sub_test_case = Class.new(self) do
        self.nuke_test_methods!

        define_singleton_method(:class_name) do
          class_name = defined?(parent_test_case.class_name) ? parent_test_case.class_name : parent_test_case
          [class_name, name].compact.join("::")
        end

        define_method(:location) do
          loc = " [#{self.failure.location}]" unless passed? or error?
          "#{self.class.class_name}##{self.name}#{loc}"
        end
      end

      sub_test_case.class_eval(&block)
      sub_test_case
    end

    def nuke_test_methods!
      self.public_instance_methods.grep(/^test_/).each do |name|
        self.send :undef_method, name
      end
    end
  end
end

::Minitest::Test.extend(Minitest::SubTestCase)
