$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))

require "minitest/autorun"
require "minitest/benchmark"

# ruby test/test_helper.rb
if __FILE__ == $0
  Dir.glob(File.expand_path("../units/**/*_test.rb", __FILE__)) { |file| require file }
end

# require "google_chart"
# require "launchy"
# 
# class MiniTest::Unit::TestCase
#   def assert_performance_constant threshold = 0.99, &work
#     validation = proc do |range, times|
#       a, b, rr = fit_linear range, times
#       assert_in_delta 0, b, 1 - threshold
#       plot(range, times, "constant")
#       [a, b, rr]
#     end
# 
#     assert_performance validation, &work
#   end
# 
#   def validation_for_fit msg, threshold
#     proc do |range, times|
#       a, b, rr = send "fit_#{msg}", range, times
#       assert_operator rr, :>=, threshold
#       plot(range, times, msg)
#       [a, b, rr]
#     end
#   end
# 
#   def plot(xs, ys, msg)
#     GoogleChart::LineChart.new("640x400", "Line Chart", false) do |chart|
#       chart.data msg.upcase, ys, '0000ff'
# 
#       chart.axis :x,
#         :range     => [xs.min, xs.max],
#         :color     => "ff0000",
#         :font_size => 16,
#         :alignment => :center
# 
#       chart.axis :y,
#         :range     => [ys.min, ys.max],
#         :color     => "ff00ff",
#         :font_size => 16,
#         :alignment => :center
# 
#       chart.grid(
#         :x_step         => 10.0,
#         :y_step         => 0.1,
#         :length_segment => 1,
#         :length_blank   => 0
#       )
# 
#       Launchy.open(chart.to_url)
#     end
#   end
# end
