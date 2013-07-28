require_relative "../test_helper"

class ArrayBenchTest < MiniTest::Unit::TestCase
  TRAILS    = 2_000
  THRESHOLD = 0.95

  def self.bench_range
    bench_linear(10_000, 50_000, 10_000)
  end

  # O(n) ######################################################################

  def bench_new
    assert_performance_linear(THRESHOLD) do |n|
      TRAILS.times { Array.new(n) }
    end
  end

  def bench_concat
    assert_performance_linear(THRESHOLD) do |n|
      subject = Array.new(n)
      concat = [1]
      TRAILS.times { |trial| subject + concat }
    end
  end

  # Very close to O(1) time on 1.9.3
  def bench_unshift
    assert_performance_linear(THRESHOLD) do |n|
      subject = Array.new(n)
      TRAILS.times { |trial| subject.unshift(trial) }
    end
  end

  # O(1) ######################################################################

  def bench_read
    assert_performance_constant(THRESHOLD) do |n|
      subject = Array.new(n)
      index   = rand(0...n)
      TRAILS.times { subject[index] }
    end
  end

  def bench_write
    assert_performance_constant(THRESHOLD) do |n|
      subject = Array.new(n)
      index   = rand(0...n)
      TRAILS.times { subject[index] = index }
    end
  end

  def bench_shift
    assert_performance_constant(THRESHOLD) do |n|
      subject = Array.new(n)
      TRAILS.times { subject.shift }
    end
  end

  def bench_pop
    assert_performance_constant(THRESHOLD) do |n|
      subject = Array.new(n)
      TRAILS.times { subject.pop }
    end
  end

  def bench_append
    assert_performance_constant(THRESHOLD) do |n|
      subject = Array.new(n)
      TRAILS.times { |trial| subject << trial }
    end
  end
end
