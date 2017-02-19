# hard 1

# two

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# The program will puts "hi" to the screen. Actually, that's incorrect. The output will be
# { :a=> 'hi there' } because the 'informal_greeting' variable references the original 
# object. Therefore, when we modify the 'informal_greeting' variable we are also modifying 
# the greetings object.