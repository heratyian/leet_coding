# Given a date, return the corresponding day of the week for that date.

# The input is given as three integers representing the day, month and year respectively.

# Return the answer as one of the following values {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}.

# Constraints:

# The given dates are valid dates between the years 1971 and 2100.

# @param {Integer} day
# @param {Integer} month
# @param {Integer} year
# @return {String}
def day_of_the_week(day, month, year)
  Time.new(year, month, day).strftime('%A')
end

require 'minitest/autorun'

class DayOfTheWeekTest < Minitest::Test
  def test_example1
    assert_equal('Saturday', day_of_the_week(31, 8, 2019))
  end

  def test_example2
    assert_equal('Sunday', day_of_the_week(18, 7, 1999))
  end

  def test_example3
    assert_equal('Sunday', day_of_the_week(15, 8, 1993))
  end
end
