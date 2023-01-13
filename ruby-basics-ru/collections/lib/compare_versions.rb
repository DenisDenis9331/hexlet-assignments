# frozen_string_literal: true

# BEGIN
def compare_versions(version1, version2)
  v1_arr = version1.split('.').map(&:to_i)
  v2_arr = version2.split('.').map(&:to_i)
  v1_arr.zip(v2_arr).each do |v1, v2|
    return 1 if v1 > v2
    return -1 if v1 < v2
  end
  0
end
# END
