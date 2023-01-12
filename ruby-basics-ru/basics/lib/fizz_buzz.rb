# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return if start > stop

  (start..stop).map do |number|
    if number % 15 == 0
      'FizzBuzz'
    elsif number % 3 == 0
      'Fizz'
    elsif number % 5 == 0
      'Buzz'
    else
      number
    end
  end.join(' ')
end
# END
