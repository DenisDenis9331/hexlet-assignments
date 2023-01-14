# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, arr)
  arr.select { |w| w.chars.sort == word.chars.sort }
end
# END
