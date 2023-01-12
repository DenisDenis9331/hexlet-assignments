# frozen_string_literal: true

# BEGIN
def reverse(str)
  reversed_str = ""
  str_length = str.length
  (str_length - 1).downto(0) do |i|
    reversed_str += str[i]
  end
  reversed_str
end
# END
