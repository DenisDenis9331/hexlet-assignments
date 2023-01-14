# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  counts = {}
  users.each do |user|
    next unless user[:gender] == 'male'

    year = user[:birthday].split('-').first
    if counts[year].nil?
      counts[year] = 1
    else
      counts[year] += 1
    end
  end
  counts
end
# END
