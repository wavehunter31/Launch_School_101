# medium_3

# five
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# refactored...
def color_valid(color)
  color == "blue" || color == "green"
end

