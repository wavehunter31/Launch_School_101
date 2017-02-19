# medium_3

# three
def tricky_method(a_string_param, an_array_param)
  a_string_param = a_string_param + "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# I already know that this method will not modify my_string but will modify my_array. 
# I don't know why. My guess is that trick_method is redefining a variable in the first
# line and modifying an object in the second.