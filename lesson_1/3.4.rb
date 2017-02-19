# hard 1

# four

def random_uuid()
  uuid = []
  characters = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f',]
  32.times do
    character = characters.sample
    uuid << character
  end
  uuid.insert(8, "-")
  uuid.insert(13, "-")
  uuid.insert(18, "-")
  uuid.insert(23, "-").join
end