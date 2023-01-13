# frozen_string_literal: true

# rubocop:disable Style/For

def make_censored(text, stop_words)
  # BEGIN
  text = text.split.map { |el| stop_words.include?(el) ? '$#%!' : el }
  text.join(' ')
  # END
end

# rubocop:enable Style/For
