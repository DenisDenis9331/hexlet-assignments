# frozen_string_literal: true

# BEGIN
def get_same_parity(arr)
  return [] if arr.empty?

  parity = arr[0].even?
  arr.select { |num| num.even? == parity }
end
# END
