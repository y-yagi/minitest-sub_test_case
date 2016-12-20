require 'test_helper'

class Minitest::SubTestCaseTest < Minitest::Test
  attr_accessor :reporter

  def run_test(test)
    output = StringIO.new("")

    self.reporter = Minitest::CompositeReporter.new
    reporter << Minitest::SummaryReporter.new(output)
    reporter << Minitest::ProgressReporter.new(output)

    reporter.start

    Minitest::Runnable.runnables.delete(test)
    test.run(reporter)
    reporter.report
  end

  def first_reporter
    reporter.reporters.first
  end

  def test_run_sub_test
    test_case = Class.new(Minitest::Test)
    sub_test_case = test_case.sub_test_case("Sub") do
      def test_success
        assert true
      end

      def test_fail
        assert false
      end
    end

    run_test(sub_test_case)
    assert_match /::Sub#test_fail/, first_reporter.results.first.to_s
  end

  def test_run_sub_sub_test
    test_case = Class.new(Minitest::Test)
    sub_test_case = test_case.sub_test_case("Sub") {}
    sub_sub_test_case = sub_test_case.sub_test_case("SubSub") do
      def test_fail
        assert false
      end
    end

    run_test(sub_sub_test_case)
    assert_match /::Sub::SubSub#test_fail/, first_reporter.results.first.to_s
  end
end
