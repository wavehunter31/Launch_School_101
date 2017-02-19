# easy 2

# two
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum_ages = 0
ages.each do |k, v|
  sum_ages += v
end

puts sum_ages

# OR

ages.values.inject(:+)
