# medium_1.rb


# one
statement = "The Flintstones Rock!"
10.times { puts statement.prepend(" ") }

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }


# two
statement = "The Flintstones Rock"
frequency = {}
statement.each_char do |char|
  if char == " "
    next
  else
    frequency[char] = statement.count(char)
  end
end


# three

# The error exists because the computer is unable to convert a number to a string.
# One way to fix this would be to use string interpolation.
# Another would be to convert the operation "40 + 2" to a string using the to_s method.


# four

# The program would output the following:

1
=> 1
3
=> 3

# The second program would ouput the following:

1
=> 4
2
=> 3


# five
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1 
  end
  divisors
end

# The number % dividend ensures that there are no remainders when dividing the number by the dividend.
# This ensures that the dividend is a factor of number

# The method will return the divisors array after it has determined all the factors of the input


# six
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

# Only the first method works because the program cannot add an array and a new elements.


# seven
limit = 15

def fib(first_num, second_num)
  while second_num < limit        # => True, because 1 is less than limit
    sum = first_num + second_num  # => sum = 1
    first_num = second_num        # => first_num is now reassigned to the value of second_num (so 1)
    second_num = sum              # => second number is now reassigned the value of the sum of both numbers (1)
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# This is an error having something to do with the scope in which the limit variable
# is defined...trying to remember why this would be a problem...so I'm remembering now 
# that methods create a new scope and so a local variable defined outside that scope would
# be inaccesible to the method...what if we made the "limit" variable a global variable?
# Looks like the global variable works! Also, the Launch School suggestion is to add
# an additional argument for "limi" to the method definition.


# eight
def titleize(string)
  a = string.split(" ")
  a.each { |word| word.capitalize! }
  a.join(" ")
end


# nine
# we want to iterate across the existing hash and create a new hash with an additional
# key-value pair for each person. Problem is, we get a runtime error when we try to change values in the hash
# during iteration. So I think we need to create a new hash with the new key value pairs and then 
# merge those into the existing hash.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

age_range = {}
munsters.each do |name, details|
  age_range[name] = {}
  details.each do |key, value|
    case value
    when (0..17)
      age_range[name]["age_group"] = "kid"
    when (18..64)
      age_range[name]["age_group"] = "adult"
    when (65..500)
      age_range[name]["age_group"] = "senior"
    end
  end
end

munsters.merge!(age_range) { |name, v1, v2| name =  v1.merge!(v2)}
