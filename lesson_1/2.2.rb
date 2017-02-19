# medium 2

# one

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_age = 0
munsters.each do |name, details|
  case details["gender"]
  when "male"
    total_age = details["age"] + total_age
  else
    next
  end
end


# two

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} year old #{details["gender"]}"
end


# three

# This one is tricky because I'm not sure exactly what the program is attempting to do.
# I also am unsure of when a method like this would be used.
# My initial thought is to use string concatenation in the first line of the method.

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# Refactored...

def add_word(word, string, array)
  string.concat(", #{word}")
  array << word
end

my_string = "pumpkins"
my_array = ["pumpkins"]
add_word("rutabaga", my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# four
sentence = "Humpty Dumpty sat on a wall."
sentence.split(" ").reverse!.join(" ")


# five

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # => This would be equal to 34


# six

# My guess is that this method would not ransack the data because a hash cannot
# be directly modified during iteration...Looks like I was wrong. I made this 
# guess because of the runtime error I experienced during an earlier assignment.


# seven

# "paper"


# eight

# The default parameters for both methods are "no". First we should evaluate
# foo so that we know the output to pass into bar. it looks like the return 
# value of the foo method will always return "yes" no matter what argument
# is passed in...so we are essentially calling bar("yes"). The bar method will
# in this case return "no".

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end











