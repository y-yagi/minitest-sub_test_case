require "minitest/sub_test_case/version"
require "minitest"

module Minitest
  module SubTestCase
    def sub_test_case(name, &block)
      parent_test_case = self
      sub_test_case = Class.new(self) do
        define_singleton_method(:class_name) do
          class_name = defined?(parent_test_case.class_name) ? parent_test_case.class_name : parent_test_case
          [class_name, name].compact.join("::")
        end

        define_singleton_method(:methods_matching) do |re|
          super(re) - parent_test_case.methods_matching(re)
        end

        define_singleton_method(:name) do
          class_name
        end

        # NOTE: `location` method needs only for support of Minitest < 5.11.
        define_method(:location) do
          loc = " [#{self.failure.location}]" unless passed? or error?
          "#{self.class.class_name}##{self.name}#{loc}"
        end
      end

      sub_test_case.class_eval(&block)
      sub_test_case
    end
  end
end

::Minitest::Test.extend(Minitest::SubTestCase)
