require "../constants.cr"

# Generates a random string of a given length.
def random_string(len : Int)
  password = [] of Char

  until len == 0
    password << CHARACTERS.sample
    len -= 1
  end

  password.join
end
