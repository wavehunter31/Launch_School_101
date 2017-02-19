# hard 1

# five

def valid_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size != 4
    return false
  elsif dot_separated_words.each { |word| is_an_ip_number?(word) }
    return true
  else
    return false
  end
end

# test
