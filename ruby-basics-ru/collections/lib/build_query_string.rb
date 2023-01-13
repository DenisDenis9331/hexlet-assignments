# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(params)
  params.sort.map { |k, v| "#{k}=#{v}" }.join('&')
end
# END
# rubocop:enable Style/For
